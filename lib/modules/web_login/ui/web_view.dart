import 'dart:async';
import 'dart:io';

import '../application_logic/web_login.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({Key? key}) : super(key: key);

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  double _pageProgressValue = 0.0;
  String portalURL = '';

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
      // initPortalURL();
    } else {
      WebView.platform = CupertinoWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'https://halodev.checkpointsystems.com',
          style: TextStyle(fontSize: 12),
        ),
      ),
      body: !portalURL.startsWith("https://halodev")
          ? Container(
              child: const Center(
                  child: SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(),
              )),
            )
          : Stack(
              children: [
                _buildWebView(portalURL),
                SizedBox(
                  height: _pageProgressValue < 1.0 ? 2 : 0,
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.white,
                    color: Colors.blue,
                    value: _pageProgressValue,
                    semanticsLabel: 'Linear progress indicator',
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildWebView(String portalURL) {
    return SingleChildScrollView(
      child: SizedBox(
        height: 1200,
        child: WebView(
          initialUrl: portalURL,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
          onProgress: (int progress) {
            print('WebView is loading (progress : $progress%)');
            setState(() {
              _pageProgressValue = progress / 100;
            });
          },
          navigationDelegate: (NavigationRequest request) {
            if (request.url.startsWith('halomobile:')) {
              print('blocking navigation to $request}');
              Navigator.pop(context, request.url);
              return NavigationDecision.prevent;
            }
            print('allowing navigation to $request');
            return NavigationDecision.navigate;
          },
          onPageStarted: (String url) {
            print('Page started loading: $url');
          },
          onPageFinished: (String url) {
            print('Page finished loading: $url');
          },
          gestureNavigationEnabled: true,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }

  // void initPortalURL() async {
  //   portalURL = await WebLogin.getPortalURL();
  //   setState(() {});
  // }
}
