
import 'package:flutter/material.dart';

class MyDialogPage extends StatefulWidget {
  const MyDialogPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyDialogPage> createState() => _MyDialogPageState();
}

class _MyDialogPageState extends State<MyDialogPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const Center(
        child: Text('Dialog'),
      )
      
    );
  }
}