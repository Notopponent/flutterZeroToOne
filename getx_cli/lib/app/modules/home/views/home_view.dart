import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          tooltip: 'Meun',
          onPressed: () {},
        ),
        actions:[
          IconButton(
            icon: const Icon(Icons.favorite),
            tooltip: 'favorite',
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'search',
            onPressed: () {},
          ),
        ]
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'HomeView is working',
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: () {
                Get.back();
              }, 
              child: Text('Get.back() - 返回上一层')
            ),
            ElevatedButton(
              onPressed: () {
                Get.snackbar("Snackbar 标题", "欢迎使用Snackbar");
              },
              child: Text("显示 Snackbar")
            )
          ],
        )
      ),
    );
  }
}
