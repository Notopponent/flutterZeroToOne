
import 'package:flutter/material.dart';

class MyGridPage extends StatefulWidget {
  const MyGridPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyGridPage> createState() => _MyGridPageState();
}

class _MyGridPageState extends State<MyGridPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const Center(
        child: Text('Grid'),
      )
      
    );
  }
}