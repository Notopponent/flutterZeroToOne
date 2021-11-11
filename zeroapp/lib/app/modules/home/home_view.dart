
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // 此小部件是您的应用程序的主页。 它是有状态的，意味着有一个State 对象（定义如下）

  // 这个State对象是状态的配置，它保存值（title）由父级（App小部件）和 State的build方法

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // 这里对 setState 的调用是告诉 Flutter 框架某些东西已经发生更改需要重新
      // 运行下面的构建方法build，以便界面可以反映更新的值

      // 如果我们直接改变 _counter 不调用setState()，那么build方法就不会调用
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 每次调用 setState 时都会重新运行此方法  例如：当_incrementCounter方法执行完成

    // Flutter 框架已经过优化，可以重新运行构建方法build重建任何需要更新的东西
    // 而不是必须单独更改小部件的实例（例如实例：_MyHomePageState）
    return Scaffold(
      appBar: AppBar(
        // 这里我们从创建的 MyHomePage 对象中获取值 widget.title
        title: Text(widget.title),
      ),
      body: Center(
        // Center 上一个布局小部件. 它需要包含一个child部件并将其定位在父级的中间位置
        child: Column(
          // Column 也是一个布局小部件。 它需要一个children部件然后垂直排列它们
          // 默认情况下，它会调整自己的大小以适合其水平的children，并试图和它的父级一样高。
          //
          // Column 有各种属性来控制它自身的大小和定位
          // 使用 mainAxisAlignment 来垂直居中Children
          // 这里的主轴是垂直的轴，因为Column是垂直的；Row的主轴是水平的轴，因为Row是水平的。
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/widget');
              }, 
              child: const Text('前往MyWidgetPage')
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}