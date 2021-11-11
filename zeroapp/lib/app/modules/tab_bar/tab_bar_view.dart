
import 'package:flutter/material.dart';

class MyTabBarPage extends StatefulWidget {
  const MyTabBarPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyTabBarPage> createState() => _MyTabBarPageState();
}

class _MyTabBarPageState extends State<MyTabBarPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const Center(
        child: Text('TabBar'),
      )
      
    );
  }
}