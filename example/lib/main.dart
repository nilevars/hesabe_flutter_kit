import 'package:hesabe_flutter_kit/hesabe_flutter_kit.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'webview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Hesabe',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  Future<String> getLaunchUrl() async {
    /// Initialize the Payment Handler with the keys from Hesabe Merchant Portal
    var hesabePaymentHandler = HesabePaymentHandler(
        baseUrl: "https://sandbox.hesabe.com",
        merchantCode: "842217",
        secretKey: "PkW64zMe5NVdrlPVNnjo2Jy9nOb7v1Xg",
        ivKey: "5NVdrlPVNnjo2Jy9",
        accessCode: "c333729b-d060-4b74-a49d-7686a8353481");

    /// Create a payment request
    var hesabePaymentRequest = HesabePaymentRequest(
        amount: "2.123",
        paymentType: "0",
        version: "2.0",
        merchantCode: "842217",
        responseUrl: "https://yoursite.com/",
        failureUrl: "https://yoursite.com/");
    String json = jsonEncode(hesabePaymentRequest);
    var paymentUrl = await hesabePaymentHandler.checkout(json);
    return paymentUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hesabe'),
      ),
      body: Center(
        child: RaisedButton(
          color: Colors.blueGrey,
          onPressed: () async {
            /// Get Payment URL
            var url = await getLaunchUrl();

            /// Launch Webview
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => MyWebView(
                      title: "Hesabe Payment",
                      selectedUrl: url,
                    )));
          },
          child: Text(
            "Open Hesabe",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
      ),
    );
  }
}
