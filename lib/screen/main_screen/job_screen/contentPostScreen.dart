import 'dart:io';

import 'package:acs_project_example/model/postModel.dart';
import 'package:acs_project_example/value/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ContentPostScreen extends StatefulWidget {
  ContentPostScreen({Key? key, required this.post}) : super(key: key);
  PostModel post;

  @override
  State<ContentPostScreen> createState() => _ContentPostScreenState(post: post);
}

class _ContentPostScreenState extends State<ContentPostScreen> {
  _ContentPostScreenState({required this.post});

  PostModel post;
  late WebViewController controller;

  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  String hideHtmlById(String idName) {
    return "document.getElementById('$idName').style.display='none'";
  }

  String hideHtmlByClass(String className) {
    return "document.getElementsByClassName('$className')[0].style.display='none'";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          post.title.toString(),
          style: TextStyle(color: colorTextWhite),
        ),
        backgroundColor: Colors.black,
      ),
      body: kIsWeb
          ? const Text("web")
          : WebView(
              initialUrl: post.link,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (controller) {
                this.controller = controller;
              },
              onPageStarted: (url) {},
              onPageFinished: (url) {
                controller.runJavascript(hideHtmlById('header'));
                controller.runJavascript(hideHtmlById('footer'));
                controller.runJavascript(hideHtmlById('zalo-vr'));
                controller.runJavascript(hideHtmlById('phone-vr'));
                controller.runJavascript(hideHtmlByClass('breadcrumbs-w'));
                controller.runJavascript(hideHtmlByClass('post-sidebar'));
                controller.runJavascript(hideHtmlByClass('post-tags'));
                controller.runJavascript(
                    hideHtmlByClass('row module module-related-post'));
                controller.runJavascript(
                    " document.getElementsByClassName('ung-tuyen')[0].href=''");
                controller.runJavascript(
                    "document.getElementsByClassName('ung-tuyen-nhanh last')[0].addEventListener("
                    "'click',"
                    "function(){"
                    "MessageInvoker.postMessage('Trigger from Javascript code')"
                    "},false)");
              },
              javascriptChannels: <JavascriptChannel>{
                JavascriptChannel(
                  name: 'MessageInvoker',
                  onMessageReceived: (message) {
                    print("da bam ung tuyen");
                  },
                )
              },
            ),
    );
  }
}
