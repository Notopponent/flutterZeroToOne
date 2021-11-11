
import 'package:flutter/material.dart';

class MyLayoutPage extends StatefulWidget {
  const MyLayoutPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyLayoutPage> createState() => _MyLayoutPageState();
}

class _MyLayoutPageState extends State<MyLayoutPage> {

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
            onPressed: () { Navigator.of(context).pushNamed('/widget/row');}, 
            child: const Text('Row'),
          ),
          ElevatedButton(
            onPressed: () { Navigator.of(context).pushNamed('/widget/column');}, 
            child: const Text('Column'),
          ),
          ElevatedButton(
            onPressed: () { Navigator.of(context).pushNamed('/widget/container');}, 
            child: const Text('Container'),
          ),
          ElevatedButton(
            onPressed: () { Navigator.of(context).pushNamed('/widget/center');}, 
            child: const Text('Center'),
          ),
        ],
      )
    );
  }
}