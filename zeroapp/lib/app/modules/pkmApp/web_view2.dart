import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebView2Page extends StatefulWidget {
  const WebView2Page({Key? key}) : super(key: key);

  @override
  _WebView2PageState createState() => _WebView2PageState();
}

class _WebView2PageState extends State<WebView2Page> {

  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
      ),);

  String indexJS = "";
  String indexFilePath = "lib/js/secret.js";

  @override
  void initState() {
    super.initState();
    rootBundle.loadString(indexFilePath).then((value) {
      indexJS = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: const Text("JavaScript Handlers")),
          body: SafeArea(
              child: Column(children: <Widget>[
                Expanded(
                  child: InAppWebView(
                    initialData: InAppWebViewInitialData(
                      // data: indexJS,
                        data: """
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    </head>
    <body>
        <h1>JavaScript Handlers</h1>
        <script type="text/javascript" src="lib/js/sss-wasm.min.js"></script>
        <script>
            class SecretManager {
              constructor() {
                  this.amount = 3;
                  this.threshold = 2;
              }
              isInteger() {
                  return this.amount;
              }
            }
            window.addEventListener("flutterInAppWebViewPlatformReady", function(event) {
                window.flutter_inappwebview.callHandler('createLongTextShares', 'JS: 我可以接收一串私钥，然后帮你进行一下分片操作')
                  .then(function(result) {     
                    let secretManager = new SecretManager();
                    let amount = secretManager.isInteger();
                    window.flutter_inappwebview.callHandler('combineLongTextShares', 'JS: 我把你的私钥分成了3片', amount);
                });
            });
        </script>
    </body>
</html>
                      """
                    ),
                    initialOptions: options,
                    onWebViewCreated: (controller) {
                      // controller.addJavaScriptHandler(handlerName: 'createLongTextShares', callback: (args) {
                      //   // return data to the JavaScript side!
                      //   print(args);
                      //   // return ';adfiadpsadf;oiu234-08werqwoeirjw[oijasdfaoijdsfasdfasdfafdsasdfafdssa';
                      // });

                      controller.addJavaScriptHandler(handlerName: 'combineLongTextShares', callback: (args) {
                        print(args);
                        return 'Dart: 我不知该干什么';
                      });
                      // print("===== myHandlerName ========");
                      // controller.addJavaScriptHandler(handlerName: 'myHandlerName', callback: (args) {
                      //   print(args);
                      //   return 'Dart: 我不知该干什么';
                      // });

                    },
                  ),
                ),
              ]))),
    );
  }
}

