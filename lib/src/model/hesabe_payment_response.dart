class HesabePaymentResponse {
  HesabePaymentResponse({
    this.status,
    this.code,
    this.message,
    this.resultCode,
    this.amount,
    this.paymentToken,
    this.paymentId,
    this.paidOn,
    this.orderReferenceNumber,
    this.variable1,
    this.variable2,
    this.variable3,
    this.variable4,
    this.variable5,
    this.administrativeCharge,
    this.method,
  });
  bool status;
  int code;
  String message;
  String resultCode;
  var amount;
  String paymentToken;
  String paymentId;
  String paidOn;
  String orderReferenceNumber;
  String variable1;
  String variable2;
  String variable3;
  String variable4;
  String variable5;
  int method;
  var administrativeCharge;

  factory HesabePaymentResponse.fromJSON(dynamic json) {
    return HesabePaymentResponse(
      status: json['status'] as bool,
      code: json['code'] as int,
      message: json['message'] as String,
      resultCode: json['response']['resultCode'] as String,
      amount: json['response']['amount'],
      paymentToken: json['response']['paymentToken'] as String,
      paymentId: json['response']['paymentToken'] as String,
      paidOn: json['response']['paidOn'] as String,
      orderReferenceNumber: json['response']['orderReferenceNumber'] as String,
      variable1: json['response']['variable1'] as String,
      variable2: json['response']['variable2'] as String,
      variable3: json['response']['variable3'] as String,
      variable4: json['response']['variable4'] as String,
      variable5: json['response']['variable5'] as String,
      method: json['response']['method'] as int,
      administrativeCharge: json['response']['administrativeCharge'],
    );
  }
}
