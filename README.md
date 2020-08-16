# Hesabe Flutter Kit

Hesabe Flutter Kit is a Dart library for integrating Hesabe Payment to your Flutter App.
Kindly refer to [Hesabe Developer Portal](https://developer.hesabe.com) for more info on API.

## Installation

Fork the git repo till the package is officially published

## Usage

```dart
import 'package:hesabe_flutter_kit/hesabe_flutter_kit.dart';

var hesabePaymentHandler = HesabePaymentHandler(
        baseUrl: "HESABE URL",
        merchantCode: "YOUR_MERCHANT_CODE",
        secretKey: "YOUR_SECRET_KEY",
        ivKey: "YOUR_IV_KEY",
        accessCode: "YOUR_ACCESS_CODE");
var hesabePaymentRequest = HesabePaymentRequest(
        amount: "PAYMENT_AMOUNT",
        paymentType: "PAYMENT_TYPE",
        version: "VERSION NUMBER",
        merchantCode: "YOUR_MERCHANT_CODE",
        responseUrl: "SUCCESS_URL",
        failureUrl: "FAILURE_URL");
String json = jsonEncode(hesabePaymentRequest);
var paymentUrl = await hesabePaymentHandler.checkout(json);
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

