
import 'package:flutter/material.dart';

class MySnackBarPage extends StatefulWidget {
  const MySnackBarPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MySnackBarPage> createState() => _MySnackBarPageState();
}

class _MySnackBarPageState extends State<MySnackBarPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const Center(
        child: Text('SnackBar'),
      )
      
    );
  }
}