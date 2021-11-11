import 'package:flutter/material.dart';
import 'app/modules/app_bar/app_bar_view.dart';
import 'app/modules/bar/bar.dart';
import 'app/modules/layout/layout_view.dart';
import 'app/modules/scaffold/scaffold_view.dart';
import 'app/modules/snack_bar/snack_bar_view.dart';
import 'app/modules/tab_bar/tab_bar_view.dart';
import 'app/modules/widget/widget_view.dart';
import 'app/modules/home/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // 这个小部件是你的应用程序的根节点
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // 这里可以配置你应用程序的主题颜色。
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/home": (_) => const MyHomePage(title: 'Flutter Demo Home Pages'),
        "/widget": (_) => const MyWidgetPage(title: 'Flutter Demo Widget Pages'),
        "/widget/scaffold": (_) => const MyScaffoldPage(title: 'Flutter Demo Scaffold Pages'),
        "/widget/bar": (_) => const MyBarPage(title: 'Flutter Demo Bar Pages'),
        "/widget/appBar": (_) => const MyAppBarPage(title: 'Flutter Demo AppBar Pages'),
        "/widget/tabBar": (_) => const MyTabBarPage(title: 'Flutter Demo TabBar Pages'),
        "/widget/snackBar": (_) => const MySnackBarPage(title: 'Flutter Demo snackBar Pages'),
        "/widget/layout": (_) => const MyLayoutPage(title: 'Flutter Demo Layout Pages'),
      },
      initialRoute: "/home",
    );
  }
}
