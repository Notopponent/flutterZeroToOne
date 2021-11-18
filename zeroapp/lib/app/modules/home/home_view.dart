
import 'package:flutter/material.dart';


// StatefulWidget也是继承自widget类，并重写了createElement()方法。
// 不同的是返回的Element 对象并不相同 - StatefulElement
// 另外StatefulWidget类中添加了一个新的接口createState()。

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title, this.initValue = 0}) : super(key: key);

  // 命名参数中的必需要传的参数要添加required关键字，这样有利于静态代码分析器进行检查；
  // 在继承 widget 时，第一个参数通常应该是Key。

  final String title;
  final int initValue;

  @override
  State<MyHomePage> createState() => _MyHomePageState();

  // 一个 StatefulWidget 类会对应一个 State 类，State表示与其对应的 StatefulWidget 要维护的状态
  // createState() 用于创建和 StatefulWidget 相关的状态，它在StatefulWidget 的生命周期中可能会被多次调用。
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    // setState 通知Flutter框架状态发生改变，要调用其build方法重新构建 widget 树，从而达到更新UI的目的。
  }

  @override
  Widget build(BuildContext context) {
    print("build");

    // build方法构建UI，运行build方法构建任何需要更新的内容，而不是必须更改实例_MyHomePageState

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),

        // widget，它表示与该 State 实例关联的 widget 实例，由Flutter 框架动态设置。
      ),
      body: Center(
        child: Column(
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

  // 当 widget 第一次插入到 widget 树时会被调用。
  @override
  void initState() {
    super.initState();
    _counter = widget.initValue;
    print("initState");
  }

  // 当State对象的依赖发生变化时会被调用, 
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }

  // 此回调是专门为了开发调试而提供的，在热重载(hot reload)时会被调用，此回调在Release模式下永远不会被调用。
  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  // 在 widget 重新构建时，Flutter 框架会调用widget.canUpdate来检测 
  // widget 树中同一位置的新旧节点，然后决定是否需要更新，
  @override
  void didUpdateWidget(MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget ");
  }

  // 当 State 对象从树中被移除时，会调用此回调
  @override
  void deactivate() {
    super.deactivate();
    print("deactivate");
  }

  // 当 State 对象从树中被永久移除时调用；通常在此回调中释放资源。
  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }
}