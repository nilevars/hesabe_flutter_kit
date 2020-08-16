import 'model/hesabe_checkout_response.dart';
import 'hesabe_crypto.dart';
import 'model/hesabe_payment_response.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'dart:convert';

class HesabePaymentHandler {
  HesabePaymentHandler({
    @required this.baseUrl,
    @required this.merchantCode,
    @required this.secretKey,
    @required this.ivKey,
    @required this.accessCode,
  }) : hesabeCrypt = HesabeCrypt(key: secretKey, iv: ivKey);
  String baseUrl;
  String merchantCode;
  String secretKey;
  String ivKey;
  String accessCode;
  HesabeCrypt hesabeCrypt;

  Future<String> checkout(String hesabePaymentRequest) async {
    print(hesabePaymentRequest);
    String encryptedRequest = hesabeCrypt.encrypt(hesabePaymentRequest);
    var url = "$baseUrl/checkout";
    var response = await http.post(url,
        headers: {'Accept': 'application/json', 'accessCode': accessCode},
        body: {'data': encryptedRequest});
    print("response ${response.body.toString()}");
    String decrypted = hesabeCrypt.decrypt(response.body.toString());
    HesabeCheckoutResponse hesabeCheckoutResponse =
        HesabeCheckoutResponse.fromJSON(jsonDecode(decrypted));
    // print(hesabeCheckoutResponse.response['data']);
    if (hesabeCheckoutResponse.code == 200) {
      var paymentUrl =
          "$baseUrl/payment?data=${hesabeCheckoutResponse.response['data']}";
      return paymentUrl;
    }
    return "";
  }

  HesabePaymentResponse getPaymentResponse(String data) {
    String decryptedString = hesabeCrypt.decrypt(data);
    print("Decryted String: ${decryptedString}");
    HesabePaymentResponse hesabePaymentResponse =
        HesabePaymentResponse.fromJSON(jsonDecode(decryptedString));
    return hesabePaymentResponse;
  }
}
