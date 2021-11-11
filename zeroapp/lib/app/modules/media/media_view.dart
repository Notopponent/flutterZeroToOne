
import 'package:flutter/material.dart';

class MyMediaPage extends StatefulWidget {
  const MyMediaPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyMediaPage> createState() => _MyMediaPageState();
}

class _MyMediaPageState extends State<MyMediaPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const Center(
        child: Text('Media'),
      )
      
    );
  }
}