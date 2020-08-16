import 'package:flutter/material.dart';
import 'package:hesabe_flutter_kit/hesabe_flutter_kit.dart';

class ResultPage extends StatefulWidget {
  final String data;
  ResultPage({this.data});

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  HesabePaymentResponse hesabePaymentResponse;
  @override
  void initState() {
    //Initialize the Payment Handler with the keys from Hesabe Merchant Portal
    var hesabePaymentHandler = HesabePaymentHandler(
        baseUrl: "https://sandbox.hesabe.com",
        merchantCode: "842217",
        secretKey: "PkW64zMe5NVdrlPVNnjo2Jy9nOb7v1Xg",
        ivKey: "5NVdrlPVNnjo2Jy9",
        accessCode: "c333729b-d060-4b74-a49d-7686a8353481");
    //Convert encrypted data received into Hesabe Payment response
    hesabePaymentResponse =
        hesabePaymentHandler.getPaymentResponse(widget.data);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Payment Status"),
        ),
        backgroundColor: Colors.grey[300],
        body: Center(
          child: Container(
            width: double.infinity,
            height: 300,
            padding: EdgeInsets.all(15),
            child: Card(
              elevation: 10,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  (hesabePaymentResponse.status == true)
                      ? Icon(
                          Icons.done,
                          color: Colors.blueGrey,
                          size: 50.0,
                        )
                      : Icon(
                          Icons.clear,
                          color: Colors.blueGrey,
                          size: 50.0,
                        ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    (hesabePaymentResponse.status == true)
                        ? "Payment Success"
                        : "Payment Not Success",
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Amount KD ${hesabePaymentResponse.amount}",
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  RaisedButton(
                    onPressed: () {},
                    child: Text(
                      "Continue Shopping",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    color: Colors.blueGrey,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
