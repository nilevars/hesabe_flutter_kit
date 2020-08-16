import 'package:hesabe_flutter_kit/hesabe_flutter_kit.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'webview.dart';

void main() {
  runApp(MyApp());
  // var hesabeCrypt = HesabeCrypt(
  //     key: "PkW64zMe5NVdrlPVNnjo2Jy9nOb7v1Xg", iv: "5NVdrlPVNnjo2Jy9");
  // print(hesabeCrypt.encrypt("Varsha kjkhkjhjkhkkj"));
  // print(hesabeCrypt.decrypt(
  //     "0e7898bd7464d0c402fe8a949d9cbf9b84c9ca6239b5e015bd42c0d4b30b12eecf89d9cecc66986c52d5145595cc68cfd7ff55c28154dbce47a35c51c12ccd3f2fd8cef0616a66fe2e45c354219adb5499af7eccb28be9ef5dca815b59eeb0d6a871bf2d73270b1ac593dcc802a26b6a750e1e451aab3344d11d1ea90a3d7ec161d0a8e75289505ab86670d5e165cb930353c711f9991c8efc9bad8857a969d272c547fda517bdd9879b267659331210e583d179f0e6d0c2575fd18690210099868abf5da2a934409a2e3f06fd926fd77d0017829a57446fa02af617929fdd87"));
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
    var hesabePaymentHandler = HesabePaymentHandler(
        baseUrl: "https://sandbox.hesabe.com",
        merchantCode: "842217",
        secretKey: "PkW64zMe5NVdrlPVNnjo2Jy9nOb7v1Xg",
        ivKey: "5NVdrlPVNnjo2Jy9",
        accessCode: "c333729b-d060-4b74-a49d-7686a8353481");
    var hesabePaymentRequest = HesabePaymentRequest(
        amount: "2.123",
        paymentType: "0",
        version: "2.0",
        merchantCode: "842217",
        responseUrl: "https://getcardinal.co/",
        failureUrl: "https://getcardinal.co/");
    String json = jsonEncode(hesabePaymentRequest);
    var paymentUrl = await hesabePaymentHandler.checkout(json);
    print(paymentUrl);
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
            var url = await getLaunchUrl();
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
