import 'dart:async';
import 'dart:io';
import 'package:ItemOptix/data/constants.dart';
import 'package:ItemOptix/views/style/colors.dart';
import 'package:ItemOptix/views/widgets/home_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ckp_plugin/flutter_ckp_plugin.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../services/channels/sdk_initialize.dart';
import '../../../services/utils.dart';
import '../../services/storage_services.dart';

class WebViewLogin extends StatefulWidget {
  final String url;
  const WebViewLogin({Key? key, required this.url}) : super(key: key);

  @override
  State<WebViewLogin> createState() => _WebViewLoginState();
}

class _WebViewLoginState extends State<WebViewLogin> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  double _pageProgressValue = 0.0;
  late String title;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    } else {
      WebView.platform = CupertinoWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    title = widget.url;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // backgroundColor: PrimaryColors.p800,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          title.length <= 45 ? title : "${title.substring(0, 45)}...",
          // 'https://halodev.checkpointsystems.com',
          style: const TextStyle(fontSize: 12),
        ),
      ),
      body: widget.url.startsWith("https://halo")
          ? Stack(
              children: [
                _buildWebView(widget.url, context),
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
            )
          : const Center(
              child: SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator.adaptive(),
              ),
            ),
    );
  }

  Widget _buildWebView(String portalURL, BuildContext context) {
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
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
            setState(() => title = request.url);
            var userDetails;
            StorageServices store = StorageServices();
            if (request.url.startsWith('halomobile:')) {
              debugPrint('blocking navigation to ${request.url}');
              // sending a message to the native side
              FlutterCkpPlugin.registerDevices(parseUrl(request.url))
                  .then((value) {
                value.forEach((key, value) {
                  if (key == "user") {
                    userDetails = value;
                    store.saveLocally(
                        Constants.locale, userDetails['language']['locale']);
                    store.setLocale(userDetails['language']['locale'], context);
                  }
                });
              });
              Get.offAll(() => HomeBottomBar(), arguments: userDetails);
              return NavigationDecision.prevent;
            }
            debugPrint('allowing navigation to $request');
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

  Future<String> getPortalURL() async {
    String initStr;

    try {
      initStr = await SDKInitialize.getPortalURL ?? 'Failed to get portal url';
    } on PlatformException {
      initStr = 'Failed to get portal url';
    }

    return initStr;
  }
}
