class HesabeCheckoutResponse {
  HesabeCheckoutResponse({this.status, this.code, this.message, this.response});
  bool status;
  int code;
  String message;
  Map<String, dynamic> response;

  factory HesabeCheckoutResponse.fromJSON(dynamic json) {
    return HesabeCheckoutResponse(
      status: json['status'] as bool,
      code: json['code'] as int,
      message: json['message'] as String,
      response: json['response'] as Map<String, dynamic>,
    );
  }
  @override
  String toString() {
    return '{ ${this.status}, ${this.code},${this.message},${this.response} }';
  }
}
