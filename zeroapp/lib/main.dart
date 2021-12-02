import 'package:flutter/material.dart';
import 'app/modules/widget/children/app_bar/app_bar_view.dart';
import 'app/modules/widget/children/bar/bar.dart';
import 'app/modules/widget/children/layout/layout_view.dart';
import 'app/modules/widget/children/scaffold/scaffold_view.dart';
import 'app/modules/widget/children/snack_bar/snack_bar_view.dart';
import 'app/modules/widget/children/tab_bar/tab_bar_view.dart';
import 'app/modules/widget/widget_view.dart';
import 'app/modules/widget/children/home/home_view.dart';

void main() {
  runApp(const MyApp());
}

// StatelessWidget继承自widget类，并重写了createElement()方法，用于不需要维护状态的场景。
// 它通常在build方法中通过嵌套其它 widget 来构建UI，在构建过程中会递归的构建其嵌套的 widget 

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // 按照惯例，widget 的构造函数参数应使用命名参数
  // 在继承 widget 时，第一个参数通常应该是Key。

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // ThemeData组件是配置应用程序的主题颜色。
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/home": (_) => const MyHomePage(title: 'Home Pages'),
        "/widget": (_) => const MyWidgetPage(title: 'Widget Pages'),
        "/widget/scaffold": (_) => const MyScaffoldPage(title: 'Scaffold Pages'),
        "/widget/bar": (_) => const MyBarPage(title: 'Bar Pages'),
        "/widget/appBar": (_) => const MyAppBarPage(title: 'AppBar Pages'),
        "/widget/tabBar": (_) => const MyTabBarPage(title: 'TabBar Pages'),
        "/widget/snackBar": (_) => const MySnackBarPage(title: 'snackBar Pages'),
        "/widget/layout": (_) => const MyLayoutPage(title: 'Layout Pages'),
      },
      initialRoute: "/home",
    );
  }
}
