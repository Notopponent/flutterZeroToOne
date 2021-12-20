
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:zeroapp/app/modules/pkmApp/scan_page1.dart';

class MyPKMPage extends StatefulWidget {
  const MyPKMPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyPKMPage> createState() => _MyPKMPageState();
}

class _MyPKMPageState extends State<MyPKMPage> {
  late InAppWebViewController webView;
  String indexFilePath = "lib/js/secret-manager.flutter.bundle.js";
  String indexJS = "";
  int number = 2;
  List<dynamic> pkList = [
    {
      'key': 1,
      'name': 'Chicago 密钥存储',
      'createTime': '2021.12.09',
      'status': 'success',
    }
  ];


  // 当 widget 第一次插入到 widget 树时会被调用。
  @override
  void initState() {
    super.initState();

    rootBundle.loadString(indexFilePath).then((value) => {
      indexJS = value
    });

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
  }

  //创建
  Future<void> createPk() async {
    SmartDialog.showLoading();
    await Future.delayed(const Duration(seconds: 2));
    SmartDialog.dismiss(); 
    SmartDialog.showToast('创建密钥对成功');
    pkList.add({
      'key': number,
      'name': '密钥' + number.toString(),
      'createTime': '2021.12.09',
      'status': 'init',
    });    
    setState(() { 
      pkList;
      number++;
    });
  }

  //删除
  void delete(index) {
    SmartDialog.showToast('密钥删除成功');
    pkList.removeAt(index);
    setState(() { pkList;});
  }

  //扫码
  void scanPk(BuildContext context, int index) {
    // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
    //   return const QRViewExample();
    // })).then((value) {
    //   print(value); //拿到扫描结果
    // });
    // webView.loadUrl(urlRequest: null);
    // ignore: avoid_print
    print(indexJS);
    webView.evaluateJavascript(source: indexJS);
  }

  //密钥分片存储
  Future<void> cloldMPC(index) async {
    SmartDialog.showLoading();
    await Future.delayed(const Duration(seconds: 2));
    SmartDialog.dismiss(); 
    SmartDialog.showToast('密钥分片存储成功');
    setState(() {
      pkList[index]['status'] = 'success';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(widget.title,
          style: const TextStyle(
            color: Colors.black
          ),
        ),
        actions: [
          IconButton(
            onPressed: (){},
            tooltip: "添加",
            icon: const Icon(Icons.refresh, color: Colors.black),
          ),
          IconButton(
            onPressed: (){},
            tooltip: "用户",
            icon: const Icon(Icons.account_circle_sharp, color: Colors.black),
          )
        ],
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: pkList.length,
        padding: const EdgeInsets.symmetric(vertical: 15),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 130,
            margin: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
            padding: const EdgeInsets.only(right: 15),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(6)),
              boxShadow:[
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(2.0, 2.0),  // 阴影xy轴的偏移量
                  blurRadius: 3.0,           // 阴影的模糊程度
                  spreadRadius: 2.0          // 阴影的扩散程度（需要和偏移量相同）
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(-2.0, -2.0),
                  blurRadius: 2.0,
                  spreadRadius: 2.0
                )
              ]
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 10,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: pkList[index]['status'] == 'success' ? Colors.green : Colors.blue,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(6),
                      bottomLeft: Radius.circular(6)
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                    Text(pkList[index]['name'],
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 10),
                      child: Text("创建时间：${pkList[index]['createTime']}"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Visibility(
                          visible: pkList[index]['status'] != 'success',
                          child: IconButton(
                            onPressed: (){scanPk(context, index);},
                            tooltip: "绑定",
                            icon: const Icon(Icons.qr_code_scanner_sharp, color: Colors.grey),
                          ),
                        ),
                        IconButton(
                          onPressed: () {delete(index);},
                          tooltip: "删除",
                          icon: const Icon(Icons.delete_outline, color: Colors.grey),
                        ),
                        IconButton(
                          onPressed: (){cloldMPC(index);},
                          tooltip: "分片存储",
                          icon: Icon(
                            Icons.cloud_upload_outlined, 
                            color: pkList[index]['status'] == 'success' ? Colors.green : Colors.grey
                          ),
                        ),
                        IconButton(
                          onPressed: (){},
                          tooltip: "设置",
                          icon: const Icon(Icons.settings, color: Colors.grey),
                        ),
                      ]
                    ),
                  ],
                  )
                ),
                Align(
                  widthFactor: 1,
                  heightFactor: 1,
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/bg1.png",
                    width: 100,
                    height: 100,
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createPk,
        tooltip: '创建',
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}