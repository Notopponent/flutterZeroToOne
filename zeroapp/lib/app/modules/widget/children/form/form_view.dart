
import 'package:flutter/material.dart';

class MyFormPage extends StatefulWidget {
  const MyFormPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const Center(
        child: Text('Form'),
      )
      
    );
  }
}