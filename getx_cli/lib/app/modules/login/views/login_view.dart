import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_cli/app/modules/home/views/home_view.dart';
import 'package:getx_cli/app/routes/app_pages.dart';
import '../controllers/login_controller.dart';


class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LoginView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'LoginView is working',
              style: TextStyle(fontSize: 20),
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(Routes.HOME);
                  }, 
                  child: Text('官方 - 前往HomeView页面')
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.to(() => HomeView());
                  }, 
                  child: Text('Get.to() - 前往HomeView页面')
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed("/home");
                  }, 
                  child: Text('Get.toNamed() - 前往HomeView页面')
                )
              ],
            )
          ]
        ),
      ),
    );
  }
}
