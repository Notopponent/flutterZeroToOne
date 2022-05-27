import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebView3Page extends StatefulWidget {
  const WebView3Page({Key? key}) : super(key: key);

  @override
  _WebView3PageState createState() => _WebView3PageState();
}

class _WebView3PageState extends State<WebView3Page> {
  HeadlessInAppWebView? headlessWebView;
  String url = "";
  String indexJS = "";
  // String indexFilePath = "lib/js/secret-manager.flutter.bundle.js";
  String indexFilePath = "lib/js/secret.js";

  @override
  void initState() {
    super.initState();

    // let secretManager = new SecretManager();
    // let originText = ';adfiadpsadf;oiu234-08werqwoeirjw[oijasdfaoijdsfasdfasdfafdsasdfafdssa';
    // secretManager.setAmount(3);
    // secretManager.setThreshold(2);
    // let sliceArr = null;
    // secretManager.createLongTextShares(originText).then(res => {
    //   console.log("sliceArr ======> ", res);
    //   sliceArr = res;

    //   secretManager.combineLongTextShares(sliceArr.slice(-2)).then(res => {
    //     console.log(res);
    //     console.log(res == originText);
    //   });
    // });

    rootBundle.loadString(indexFilePath).then((value) {
      indexJS = value;


      headlessWebView = HeadlessInAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse("https://github.com/flutter")),
        onLoadStop: (controller, url) async {
          print(indexJS);
          // var result = await controller.evaluateJavascript(source: indexFilePath);

          // controller.addJavaScriptHandler(handlerName: 'createLongTextShares', callback: (args) {
          //   print("========== createLongTextShares ======== ");
          // });
          
          // print(result.runtimeType);
          // print(result);

          // print(indexJS);
          // controller.addJavaScriptHandler(handlerName: 'createLongTextShares', callback: (args) {
          //   // return data to the JavaScript side!
          //   print(args);
          //   return ';adfiadpsadf;oiu234-08werqwoeirjw[oijasdfaoijdsfasdfasdfafdsasdfafdssa';
          // });

          // controller.addJavaScriptHandler(handlerName: 'combineLongTextShares', callback: (args) {
          //   print(args);
          //   return 'Dart: 我不知该干什么';
          // });

          print("===== myHandlerName  onLoadStop========");
          controller.addJavaScriptHandler(handlerName: 'myHandlerName', callback: (args) {
            print(args);
            return 'Dart: 我不知该干什么';
          });
        },
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    headlessWebView?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("HeadlessInAppWebView Example")
        ),
        body: SafeArea(
            child: Column(children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Text(
                "URL: ${(url.length > 50) ? url.substring(0, 50) + "..." : url}"),
          ),
          Center(
            child: ElevatedButton(
                onPressed: () async {
                  await headlessWebView?.dispose();
                  await headlessWebView?.run();
                },
                child: const Text("Run HeadlessInAppWebView")),
          ),
        ])));
  }
}