import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'result.dart';

class MyWebView extends StatefulWidget {
  final String title;
  final String selectedUrl;

  MyWebView({
    @required this.title,
    @required this.selectedUrl,
  });

  @override
  _MyWebViewState createState() => _MyWebViewState();
}

class _MyWebViewState extends State<MyWebView> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  bool isLoading = true;
  final _key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),

        /// Initialize Webview
        body: Stack(
          children: [
            WebView(
              key: _key,
              initialUrl: widget.selectedUrl,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
              },
              onPageStarted: (String url) {
                setState(() {
                  isLoading = true;
                });
              },
              onPageFinished: (String url) {
                setState(() {
                  isLoading = false;
                });

                /// If url in webview contains https://yoursite.com/ navigate to result page with with encrypted data
                if (url.contains("https://yoursite.com/")) {
                  Uri uri = Uri.parse(url);
                  if (uri.queryParameters.containsKey("data")) {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => ResultPage(
                              data: uri.queryParameters["data"],
                            )));
                  }
                }
              },
            ),
            isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Stack(),
          ],
        ));
  }
}
