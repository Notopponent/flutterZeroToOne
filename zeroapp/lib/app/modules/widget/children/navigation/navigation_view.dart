
import 'package:flutter/material.dart';

class MyNavigationPage extends StatefulWidget {
  const MyNavigationPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyNavigationPage> createState() => _MyNavigationPageState();
}

class _MyNavigationPageState extends State<MyNavigationPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const Center(
        child: Text('Navigation'),
      )
      
    );
  }
}