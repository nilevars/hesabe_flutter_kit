import 'model/hesabe_checkout_response.dart';
import 'hesabe_crypto.dart';
import 'model/hesabe_payment_response.dart';
import 'dart:async';
import 'package:http/io_client.dart';
import 'dart:io';
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
    ///Encrypt Request
    String encryptedRequest = hesabeCrypt.encrypt(hesabePaymentRequest);
    var url = "$baseUrl/checkout";

    ///Call the  checkout endpoint for Token by passing the payment request
    try {
      final ioc = new HttpClient();
      ioc.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      final http = new IOClient(ioc);
      var response = await http.post(url,
          headers: {'Accept': 'application/json', 'accessCode': accessCode},
          body: {'data': encryptedRequest});
      String decrypted = hesabeCrypt.decrypt(response.body.toString());
      HesabeCheckoutResponse hesabeCheckoutResponse =
          HesabeCheckoutResponse.fromJSON(jsonDecode(decrypted));
      if (hesabeCheckoutResponse.code == 200) {
        var paymentUrl =
            "$baseUrl/payment?data=${hesabeCheckoutResponse.response['data']}";
        return paymentUrl;
      }
    } catch (e) {
      throw new Exception(e.toString());
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
