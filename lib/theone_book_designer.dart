import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'dart:collection';

class TheOneBookDesigner extends StatelessWidget {
  final List<String> imageUrls;

  const TheOneBookDesigner({super.key, required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return loadWebView();
  }

  Widget loadWebView() {
    InAppWebViewController? webView;
    InAppWebViewController.clearAllCache();
    final key = UniqueKey();

    try {
      return InAppWebView(
        initialFile: 'packages/theone_book_designer/assets/index.html',
        initialUserScripts: UnmodifiableListView<UserScript>([]),
        key: key,
        initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
            supportZoom: false,
            useShouldOverrideUrlLoading: true,
            allowFileAccessFromFileURLs: true,
            transparentBackground: true, // Enable transparency
          ),
          ios: IOSInAppWebViewOptions(),
          android: AndroidInAppWebViewOptions(),
        ),
        onWebViewCreated: (InAppWebViewController inAppController) {
          webView = inAppController;
        },
        onLoadStop: (controller, url) async {
          // Create a string representation of the image URLs
          final String imageArray = imageUrls.map((url) => "'$url'").join(',');
          await webView?.evaluateJavascript(
            source:
                "console.log('Adding pages:', [$imageArray]); addPages([$imageArray]);",
          );
        },
        onLoadError: (controller, url, code, message) {
          debugPrint('Webview Error: $message');
        },
      );
    } catch (e, st) {
      debugPrint('Webview Error: $e, $st');
      return Container();
    }
  }
}
