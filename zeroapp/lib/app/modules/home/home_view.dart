
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

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
            onPressed: () { Navigator.of(context).pushNamed('/widget');}, 
            child: const Text('初学 Flutter'),
          ),
          ElevatedButton(
            onPressed: () { Navigator.of(context).pushNamed('/pkm');}, 
            child: const Text('私钥管理App'),
          ),
        ],
      )
    );
  }
}