# Hesabe Flutter Kit

Hesabe Flutter Kit is a Dart library for integrating Hesabe Payment to your Flutter App.
Kindly refer to [Hesabe Developer Portal](https://developer.hesabe.com) for more info on API.

## Installation

Fork the git repo till the package is officially published

## Usage

```dart
import 'package:hesabe_flutter_kit/hesabe_flutter_kit.dart';

///Initialize the payment handler with your credentials
var hesabePaymentHandler = HesabePaymentHandler(
        baseUrl: "HESABE_URL",
        merchantCode: "YOUR_MERCHANT_CODE",
        secretKey: "YOUR_SECRET_KEY",
        ivKey: "YOUR_IV_KEY",
        accessCode: "YOUR_ACCESS_CODE");

///Create a payment request
var hesabePaymentRequest = HesabePaymentRequest(
        amount: "PAYMENT_AMOUNT",
        paymentType: "PAYMENT_TYPE",
        version: "VERSION_NUMBER",
        merchantCode: "YOUR_MERCHANT_CODE",
        responseUrl: "SUCCESS_URL",
        failureUrl: "FAILURE_URL");

///Pass the payment request to payment handler to get the checkout URL
var paymentUrl = await hesabePaymentHandler.checkout(jsonEncode(hesabePaymentRequest));

///Complete the payment in webview

///Decode the data received from the webview to HesabePaymentResponse Instance
HesabePaymentResponse hesabePaymentResponse =
        hesabePaymentHandler.getPaymentResponse(data);

///Use the Payment Response instance to check the transaction details 
///Transaction Details includes status of payment,amount,paymentId and so on
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

