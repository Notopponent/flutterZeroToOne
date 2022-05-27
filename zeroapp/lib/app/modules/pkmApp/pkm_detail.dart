import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class MyPKDetailPage extends StatefulWidget {
  const MyPKDetailPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyPKDetailPage> createState() => _MyPKDetailPageState();
}

class _MyPKDetailPageState extends State<MyPKDetailPage> {
  List<dynamic> pkList = [
    {
      'key': '私钥片段1',
      'name': '分片1',
      'isChoose': false,
      'value': '013d5ddb23e40aeb02f20930c6056af9a11ef086796b24804c2907d5ec9bee971fb4756a07fd22c757cb0b453f7e87e44ff60afa49e196cbd015d2c6141efb8cb608e444aa8f70b5b47339df60a4b6e3e9415af02f78d240813e3fb12a81dff186a779eeea3c533ee9de1da891831aadb7_01c966bd6a8dd3895013bed273a5822683ce31079fa4d05683bb2a5ca7c0837a243be2e5bd66887ea3104c4055fcf94d4a5f0a6e43b1d4398fc82d01ce6d200a4fa0bdabd8bac627550fac415eea61a5f23ea5a436f374ca3e34ce64486d888aca64c4a866327ba76a7cda46b8e5b51b55',
    },
    {
      'key': '私钥片段2',
      'name': '分片2',
      'isChoose': false,
      'value': '02019d357e95ce6c85a52a3fdbd4a963d1cb4302621eb9d39f99ba0dfd81762210b4756a07fd22c757cb0b453f7e87e44ff60afa49e196cbd015d2c6141efb8cb608e444aa8f70b5b47339df60a4b6e3e9415af02f78d240813e3fb12a81dff186a779eeea3c533ee9de1da891831aadb7_027811ba502856a046dacb850f3bafd7c539551b949616c7bc943644a861abac423be2e5bd66887ea3104c4055fcf94d4a5f0a6e43b1d4398fc82d01ce6d200a4fa0bdabd8bac627550fac415eea61a5f23ea5a436f374ca3e34ce64486d888aca64c4a866327ba76a7cda46b8e5b51b55',
    },
    {
      'key': '私钥片段3',
      'name': '分片3',
      'isChoose': false,
      'value': '0315dd6fbcba7b11f861c23ad09be8150871db7e6bc43be22700d145f27ef7b815b4756a07fd22c757cb0b453f7e87e44ff60afa49e196cbd015d2c6141efb8cb608e444aa8f70b5b47339df60a4b6e3e9415af02f78d240813e3fb12a81dff186a779eeea3c533ee9de1da891831aadb7_03173c4e464bdc4ebd9d1141d2b8b4710e9d80e664715441a978cb4cadf7b317603be2e5bd66887ea3104c4055fcf94d4a5f0a6e43b1d4398fc82d01ce6d200a4fa0bdabd8bac627550fac415eea61a5f23ea5a436f374ca3e34ce64486d888aca64c4a866327ba76a7cda46b8e5b51b55',
    }
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text(widget.title ),
      ),
      body: Column(
        children:[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(10),
                child: const Text('分片信息',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10, top: 10),
                child:ElevatedButton(
                  onPressed: () async {
                    SmartDialog.showLoading();
                    await Future.delayed(const Duration(seconds: 2));
                    SmartDialog.dismiss(); 
                    SmartDialog.showToast('分片恢复成功');
                    Navigator.pop(context, '分片成功');
                  }, 
                  child: const Text('私钥恢复')
                )
              )
            ]
          ),
          Expanded(
            child: ListView.builder(
              itemCount: pkList.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  color: Colors.white,
                  margin: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(pkList[index]['key']),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Switch(
                              value: pkList[index]?['isChoose'],
                              onChanged: (value) {
                                pkList[index]['isChoose'] = value;
                                setState(() {});
                              }
                            )
                          )
                        ],
                      ),
                      Text(pkList[index]['value'])
                    ],
                  ),
                );
              },
            ),
          )
        ]
      ),
    );
  }
}