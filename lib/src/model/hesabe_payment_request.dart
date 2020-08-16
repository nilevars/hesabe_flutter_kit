import 'package:meta/meta.dart';

class HesabePaymentRequest {
  HesabePaymentRequest({
    @required this.amount,
    this.currency,
    @required this.paymentType,
    this.orderReferenceNumber,
    @required this.version,
    this.variable1,
    this.variable2,
    this.variable3,
    this.variable4,
    this.variable5,
    @required this.merchantCode,
    @required this.responseUrl,
    @required this.failureUrl,
  });
  String amount;
  String currency;
  String paymentType;
  String orderReferenceNumber;
  String version;
  String variable1;
  String variable2;
  String variable3;
  String variable4;
  String variable5;
  String merchantCode;
  String responseUrl;
  String failureUrl;

  Map toJson() => {
        'amount': amount,
        'currency': currency,
        'paymentType': paymentType,
        'orderReferenceNumber': orderReferenceNumber,
        'version': version,
        'variable1': variable1,
        'variable2': variable2,
        'variable3': variable3,
        'variable4': variable4,
        'variable5': variable5,
        'merchantCode': merchantCode,
        'responseUrl': responseUrl,
        'failureUrl': failureUrl
      };
}
