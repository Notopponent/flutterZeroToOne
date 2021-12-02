
import 'package:flutter/material.dart';

class MyListPage extends StatefulWidget {
  const MyListPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyListPage> createState() => _MyListPageState();
}

class _MyListPageState extends State<MyListPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const Center(
        child: Text('List'),
      )
      
    );
  }
}