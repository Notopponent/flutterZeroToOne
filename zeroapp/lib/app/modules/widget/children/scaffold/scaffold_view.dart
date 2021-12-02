
import 'package:flutter/material.dart';

class MyScaffoldPage extends StatefulWidget {
  const MyScaffoldPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyScaffoldPage> createState() => _MyScaffoldPageState();
}

class _MyScaffoldPageState extends State<MyScaffoldPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(
          onPressed: (){ Navigator.pop(context);}, 
          icon: const Icon(Icons.arrow_back_sharp, color: Colors.white,)
        ),
      ),
      body: const Center(
        child: Text('Scaffold'),
      ),
      backgroundColor: Colors.green[100],
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      endDrawer: const Drawer(
        child: Center(child: Text("Right Draw")),
      ),
      persistentFooterButtons: [
        TextButton(onPressed: (){}, child: const Text("Text1")),
        TextButton(onPressed: (){}, child: const Text("Text2")),
      ],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: "tab1",
            icon: Icon(Icons.settings)
          ),
          BottomNavigationBarItem(
            label: "tab2",
            icon: Icon(Icons.settings)
          )
        ],
      ),
    );
  }
}