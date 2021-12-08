
import 'package:flutter/material.dart';
import 'package:zeroapp/app/modules/pkmApp/scan_page1.dart';

class MyPKMPage extends StatefulWidget {
  const MyPKMPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyPKMPage> createState() => _MyPKMPageState();
}

class _MyPKMPageState extends State<MyPKMPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        padding: const EdgeInsets.all(8),
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return QRViewExample();
              })).then((value) {
                print(value); //拿到扫描结果
              });
            }, 
            child: const Text('私钥1'),
          ),
        ],
      )
    );
  }
}