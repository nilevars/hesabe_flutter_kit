# Hesabe Flutter Kit

Hesabe Flutter Kit is a Dart library for integrating Hesabe Payment to your Flutter App.

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
        amount: "2.123",
        paymentType: "PAYMENT_TYPE",
        version: "2.0",
        merchantCode: "842217",
        responseUrl: "SUCCESS_URL",
        failureUrl: "FAILURE_URL");
String json = jsonEncode(hesabePaymentRequest);
var paymentUrl = await hesabePaymentHandler.checkout(json);
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

