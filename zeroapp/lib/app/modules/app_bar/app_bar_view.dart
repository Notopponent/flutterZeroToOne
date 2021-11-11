
import 'package:flutter/material.dart';

class MyAppBarPage extends StatefulWidget {
  const MyAppBarPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyAppBarPage> createState() => _MyAppBarPageState();
}

class _MyAppBarPageState extends State<MyAppBarPage> with SingleTickerProviderStateMixin{

  final GlobalKey _appBarKey = GlobalKey();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: _appBarKey,
        title: Text(widget.title),
        leading: IconButton(
          onPressed: (){ Navigator.pop(context);}, 
          icon: const Icon(Icons.arrow_back_sharp)
        ),
        leadingWidth: 60,
        // 当leading 未配置时，在二级页面下会自动展示一个返回键，默认值为 true
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){},
            tooltip: "扫一扫",
            icon: const Icon(Icons.qr_code_scanner),
          ),
          IconButton(
            onPressed: (){},
            tooltip: "添加",
            icon: const Icon(Icons.add),
          )
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: "火车", icon: Icon(Icons.bus_alert),),
            Tab(text: "汽车", icon: Icon(Icons.bus_alert),)
          ],
        ),
        elevation: 10,
        shadowColor: Colors.blue,
        shape: const RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.grey,
            width: 1
          ),
        ),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.black,
        iconTheme: const IconThemeData(
          color: Colors.red,
          opacity: 1,
          size: 50
        ),
        actionsIconTheme: const IconThemeData(
          color: Colors.green,
        ),
      ),
      body: const Center(
        child: Text('AppBar'),
      )
    );
  }
}