
import 'package:flutter/material.dart';

class MyBarPage extends StatefulWidget {
  const MyBarPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyBarPage> createState() => _MyBarPageState();
}

class _MyBarPageState extends State<MyBarPage> {

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
            onPressed: () { Navigator.of(context).pushNamed('/widget/appBar');}, 
            child: const Text('AppBar'),
          ),
          ElevatedButton(
            onPressed: () { Navigator.of(context).pushNamed('/widget/tabBar');}, 
            child: const Text('TabBar'),
          ),
          ElevatedButton(
            onPressed: () { Navigator.of(context).pushNamed('/widget/snackBar');}, 
            child: const Text('SnackBar'),
          ),
        ],
      )
    );
  }
}