
import 'package:flutter/material.dart';

class MyWidgetPage extends StatefulWidget {
  const MyWidgetPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyWidgetPage> createState() => _MyWidgetPageState();
}

class _MyWidgetPageState extends State<MyWidgetPage> {

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
          // Navigator.of(context).pushNamed('/widget');
          ElevatedButton(
            onPressed: () { Navigator.of(context).pushNamed('/widget/scaffold');}, 
            child: const Text('Scaffold'),
          ),
          ElevatedButton(
            onPressed: () { Navigator.of(context).pushNamed('/widget/bar');}, 
            child: const Text('Bar'),
          ),
          ElevatedButton(
            onPressed: () { Navigator.of(context).pushNamed('/widget/layout');}, 
            child: const Text('Layout'),
          ),
          ElevatedButton(
            onPressed: () { Navigator.of(context).pushNamed('/widget/grid');}, 
            child: const Text('Grid'),
          ),
          ElevatedButton(
            onPressed: () { Navigator.of(context).pushNamed('/widget/form');}, 
            child: const Text('Form'),
          ),
          ElevatedButton(
            onPressed: () { Navigator.of(context).pushNamed('/widget/list');}, 
            child: const Text('List'),
          ),
          ElevatedButton(
            onPressed: () { Navigator.of(context).pushNamed('/widget/dialog');}, 
            child: const Text('Dialog'),
          ),
          ElevatedButton(
            onPressed: () { Navigator.of(context).pushNamed('/widget/media');}, 
            child: const Text('Media'),
          ),
          ElevatedButton(
            onPressed: () { Navigator.of(context).pushNamed('/widget/navigation');}, 
            child: const Text('Navigation'),
          ),
        ],
      )
    );
  }
}