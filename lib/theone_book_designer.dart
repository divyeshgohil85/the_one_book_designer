/// The One Book Designer: A tool for designing books with customizable templates.
///
/// This library provides functionality to create, edit, and export book designs.
library;

import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class TheOneBookDesigner extends StatelessWidget {
  /// This will ask you to provide the web images you want show in the book view
  final List<String> imageUrls;

  const TheOneBookDesigner({super.key, required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    /// This will load the webview and load your images
    return loadBookView();
  }

  /// This widget loads the images and load the core logic
  Widget loadBookView() {
    InAppWebViewController? webView;
    InAppWebViewController.clearAllCache();
    final key = UniqueKey();

    try {
      return InAppWebView(
        initialFile: 'packages/theone_book_designer/assets/index.html',
        initialUserScripts: UnmodifiableListView<UserScript>([]),
        key: key,
        initialSettings: InAppWebViewSettings(
          allowsInlineMediaPlayback: true,
          transparentBackground: true,
          disableVerticalScroll: true,
          disableHorizontalScroll: true,
          supportZoom: false,
          useShouldOverrideUrlLoading: true,
          allowFileAccessFromFileURLs: true,
        ),
        onWebViewCreated: (InAppWebViewController inAppController) {
          webView = inAppController;
        },
        onLoadStop: (controller, url) async {
          // Create a string representation of the image URLs
          final String imageArray = imageUrls.map((url) => "'$url'").join(',');
          await webView?.evaluateJavascript(
            source: "console.log('Adding pages:', [$imageArray]); addPages([$imageArray]);",
          );
        },
        onReceivedError: (controller, request, error) {
          debugPrint('Webview Error: $error');
        },
      );
    } catch (e, st) {
      debugPrint('Webview Error: $e, $st');
      return Container();
    }
  }
}
