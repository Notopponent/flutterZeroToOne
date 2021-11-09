import 'package:get/get.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    print('Login onInit');
  }

  @override
  void onReady() {
    super.onReady();
    print('Login onReady');
  }

  @override
  void onClose() {
    print('Login onClose');
  }
  void increment() => count.value++;
}
