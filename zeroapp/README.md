# ZeroApp

## `2021.11.18 课程目标：`
* 搭建一个最简单的Flutter项目

## `学习资源链接`

- [Dart 官方文档](https://dart.dev/guides)
- [编写第一个Flutter应用](https://flutter.dev/docs/get-started/codelab)
- [Flutter示例列表](https://flutter.dev/docs/cookbook)
- [Flutter Gallery](https://gallery.flutter.dev/#/)
- [Flutter实战·第二版](https://book.flutterchina.club/preface.html)
- [Material Components widgets](https://docs.flutter.dev/development/ui/widgets/material)
- [Cupertino (iOS-style) widgets](https://docs.flutter.dev/development/ui/widgets/cupertino)

## `widget的解释：`

* widget 的功能是“描述一个UI元素的配置信息”

* Flutter 中的 widget ，它不仅可以表示UI元素，也可以表示一些功能性的组件如：用于手势检测的 GestureDetector 、用于APP主题数据传递的 Theme。

* 小部件、控件、组件都可以理解为是Widget。Flutter 中是通过 Widget 嵌套 Widget 的方式来构建UI和进行实践处理的，所以记住，Flutter 中万物皆为Widget。

* “一个 widget 可以对应多个Element”；Flutter 框架在构建UI树时，会先调用此方法生成对应节点的Element对象。此方法是 Flutter 框架隐式调用的，在我们开发过程中基本不会调用到。

* Widget类本身是一个抽象类，其中最核心的就是定义了createElement()接口，在 Flutter 开发中，我们一般都不用直接继承Widget类来实现一个新组件，相反，我们通常会通过继承StatelessWidget或StatefulWidget来间接继承widget类来实现。StatelessWidget和StatefulWidget都是直接继承自Widget类，而这两个类也正是 Flutter 中非常重要的两个抽象类

* 按照惯例，widget 的构造函数参数应使用命名参数。命名参数中的必需要传的参数要添加required关键字，这样有利于静态代码分析器进行检查。在继承 widget 时，第一个参数通常应该是Key。同样是按照惯例， widget 的属性应尽可能的被声明为final，防止被意外改变。

## `canUpdate(...) 静态方法`

它主要用于在 widget 树重新build时复用旧的 widget ，其实具体来说，应该是：是否用新的 widget 对象去更新旧UI树上所对应的Element对象的配置；通过其源码我们可以看到，只要new widget与old widget的runtimeType和key同时相等时就会用new widget去更新Element对象的配置，否则就会创建新的Element。

## `StateLessWidget 和 StatefulWidget`

* StatelessWidget继承自widget类，并重写了createElement()方法。用于不需要维护状态的场景，它通常在build方法中通过嵌套其它 widget 来构建UI，在构建过程中会递归的构建其嵌套的 widget 

* build方法有一个context参数，它是BuildContext类的一个实例，表示当前 widget 在 widget 树中的上下文，每一个 widget 都会对应一个 context 对象（因为每一个 widget 都是 widget 树上的一个节点）。实际上，context是当前 widget 在 widget 树中位置执行”相关操作“的一个句柄(handle)，比如它提供了从当前 widget 开始向上遍历 widget 树以及按照 widget 类型查找父级 widget 的方法。

* StatefulWidget也是继承自widget类，并重写了createElement()方法，不同的是返回的Element 对象并不相同；另外StatefulWidget类中添加了一个新的接口createState()。

* createState() 用于创建和 StatefulWidget 相关的状态，它在StatefulWidget 的生命周期中可能会被多次调用。例如，当一个 StatefulWidget 同时插入到 widget 树的多个位置时，Flutter 框架就会调用该方法为每一个位置生成一个独立的State实例，其实，本质上就是一个StatefulElement对应一个State实例。

* 一个 StatefulWidget 类会对应一个 State 类，State表示与其对应的 StatefulWidget 要维护的状态

## `State的生命周期`

initState()

* 当 widget 第一次插入到 widget 树时会被调用，对于每一个State对象，Flutter 框架只会调用一次该回调，所以，通常在该回调中做一些一次性的操作，如状态初始化、订阅子树的事件通知等

didChangeDependencies()

* 当State对象的依赖发生变化时会被调用, 例如：在之前build() 中包含了一个InheritedWidget，然后在之后的build() 中Inherited widget发生了变化，那么此时Inherited widget的子 widget 的didChangeDependencies()回调都会被调用。典型的场景是当系统语言 Locale 或应用主题改变时，Flutter 框架会通知 widget 调用此回调。

build()

* 它主要是用于构建 widget 子树的，会在如下场景被调用：
* 在调用initState()之后
* 在调用didUpdateWidget()之后
* 在调用setState()之后
* 在调用didChangeDependencies()之后
* 在State对象从树中一个位置移除后又重新插入到树的其它位置之后

reassemble()

* 此回调是专门为了开发调试而提供的，在热重载(hot reload)时会被调用，此回调在Release模式下永远不会被调用。 Chrome中调试不支持（hot reload）

didUpdateWidget ()

* 在 widget 重新构建时，Flutter 框架会调用widget.canUpdate来检测 widget 树中同一位置的新旧节点，然后决定是否需要更新，如果widget.canUpdate会在新旧 widget 的 key 和 runtimeType 同时相等时会返回true，调用此回调。

deactivate()

* 当 State 对象从树中被移除时，会调用此回调

dispose()

* 当 State 对象从树中被永久移除时调用；通常在此回调中释放资源。

## `Flutter 组件前加const有什么作用？ `
* https://blog.csdn.net/plokmju88/article/details/118098184

* 结论：在 Flutter 中，Widget 本质只是一个信息配置的元素，它被定义为不可变的，任何的变化反映出来就是销毁 & 重建。而 Widget 不可变之所以不太会影响效率，背后是因为 Element 实现了对 Widget 变化的抽象。也就是虽然 Widget 会被重建，但是 Widget 背后的 Element，却得到了复用。

* 同时 Flutter Framework，自有一套更新策略，确保 Widget 变化的同时，尽可能的复用 Element 对象。这个策略的逻辑在 Element 的 updateChild() 方法中，该方法在 Element 树建立和更新的过程中都非常的重要。
`
## `InheritedWidget（数据共享）

* InheritedWidget是 Flutter 中非常重要的一个功能型组件，它提供了一种在 widget 树中从上到下共享数据的方式，比如我们在应用的根 widget 中通过InheritedWidget共享了一个数据，那么我们便可以在任意子widget 中来获取该共享的数据！如Flutter SDK中正是通过 InheritedWidget 来共享应用主题（Theme）和 Locale (当前语言环境)信息的。

## `深入浅出组件`

> MaterialApp属性和说明 - 总共33个属性

|  字段   | 属性  | 描述  |
|  ----  | ----  | ----  |
| `title`  | `String` | `程序切换时显示的标题` |
| `theme`  | `ThemeData` | `主题颜色` |
| `home`  | `Widget` | `主页，程序进入后的第一个界面` |
| `routes`  | `Map<String, WidgetBuilder>` | `应用程序顶级路由表` |
| `initialRoute`  | `String` | `如果构建了导航器，则会显示第一个路由的名称` |
| onGenerateRoute  | RouteFactory | 路由管理拦截器 |
| onGenerateInitialRoutes  | InitialRouteListFactory | 生成初始化路由 |
| onUnknownRoute  | RouteFactory | 当onGenerateRoute无法生成路由时调用 |
| navigatorObservers  | List | 创建导航器的观察者列表 |
| navigatorKey  | GlobalKey | 导航键 |
| scaffoldMessengerKey  | GlobalKey | 脚手架键 |
| builder  | TransitionBuilder | 在导航器上面插入小部件 |
| onGenerateTitle  | GenerateAppTitle | 程序切换时生成标题字符串 |
| color  | Color | 程序切换时应用图标背景颜色（仅安卓有效） |
| darkTheme  | ThemeData | 暗黑模式主题颜色 |
| highContrastTheme  | ThemeData | 系统请求“高对比度”使用的主题 |
| highContrastDarkTheme  | ThemeData | 系统请求“高对比度”暗黑模式下使用的主题颜色 |
| themeMode  | ThemeMode | 使用哪种模式的主题（默认跟随系统） |
| locale  | Locale | 初始区域设置 |
| localizationsDelegates  | Iterable<LocalizationsDelegate> | 本地化代理 |
| localeListResolutionCallback  | LocaleListResolutionCallback | 失败或未提供设备的语言环境 |
| localeResolutionCallback  | LocaleResolutionCallback | 负责计算语言环境 |
| supportedLocales  | Iterable | 本地化地区列表 |
| debugShowMaterialGrid  | bool | 绘制基线网格叠加层（仅debug模式） |
| showPerformanceOverlay  | bool | 显示性能叠加 |
| checkerboardRasterCacheImages  | bool | 打开栅格缓存图像的棋盘格 |
| checkerboardOffscreenLayers  | bool | 打开渲染到屏幕外位图的层的棋盘格 |
| showSemanticsDebugger  | bool | 打开显示可访问性信息的叠加层 |
| debugShowCheckedModeBanner  | bool | 调试显示检查模式横幅 |
| shortcuts  | Map<LogicalKeySet, Intent> | 应用程序意图的键盘快捷键的默认映射 |
| actions  | Map<Type, Action> | 包含和定义用户操作的映射 |
| restorationScopeId  | String | 应用程序状态恢复的标识符 |
| scrollBehavior  | ScrollBehavior | 可滚动小部件的行为方式 |

> Scaffold属性和说明 - 总共23个属性

|  字段   | 属性  | 描述  |
|  ----  | ----  | ----  |
| `appBar` | `PreferredSizeWidget` | `显示脚手架的顶部导航区` |
| `body` | `Widget` | `显示脚手架的主要内容` |
| `floatingActionButton` | `Widget` | `悬浮按钮，默认位于右下角` |
| `floatingActionButtonLocation` | `FloatingActionButtonLocation` | `决定悬浮按钮的位置`|
| `floatingActionButtonAnimator` | `FloatingActionButtonAnimator` | `决定悬浮按钮的动画`|
| `persistentFooterButtons` | `List` | `显示在脚手架底部的一组按钮` |
| `bottomNavigationBar` | `Widget` | `底部导航条` |
| `backgroundColor` | `Color` | `脚手架背景颜色` |
| `drawer` | `Widget` | `左侧抽屉菜单组件` |
| `endDrawer` | `Widget` | `右侧抽屉菜单组件` |
| bottomSheet | Widget | 持久在body下方，底部控件上方的控件 |
| onDrawerChanged | DrawerCallback | 左侧抽屉菜单改变事件回调 |
| onEndDrawerChanged | DrawerCallback | 右侧抽屉菜单改变事件回调 |
| resizeToAvoidBottomInset | bool | 防止小组件重复 |
| primary | bool | 脚手架是否延伸到顶部 |
| drawerDragStartBehavior | DragStartBehavior | 检测手势行为方式，与drawer配合使用 |
| extendBody | bool | 是否延伸到底部 |
| extendBodyBehindAppBar  | bool | 是否延伸到顶部，用于做半透明、毛玻璃效果的主要控制属性 |
| drawerScrimColor | Color | 侧边栏弹出时非遮盖层主页面的颜色 |
| drawerEdgeDragWidth | double | 侧边栏弹出时非遮罩层的宽度 |
| drawerEnableOpenDragGesture | bool | 左侧抽屉是否支持手势滑动 |
| endDrawerEnableOpenDragGesture | bool | 右侧抽屉是否支持手势滑动 |
| restorationId| String| 状态还原标识符 |


> AppBar - 总共28个属性

|  字段   | 属性  | 描述  |
|  ----  | ----  | ----  |
| `key` | `Key` | `当组件在组件树中移动时使用Key可以保持组件之前状态` |
| `leading` | `Widget` | `通常情况下返回一个返回键（IconButton)` |
| `leadingWidth` | `double` | `左侧leading的宽度，默认56` |
| `title` | `Widget` | `导航栏的标题` |
| `centerTitle` | `bool` | `标题是否居中，不同操作系统默认显示位置不一样` |
| `actions` | `List` | `一个Widget列表` |
| `bottom` | `PreferredSizeWidget` | `出现在导航栏底部的控件` |
| `elevation` | `double` | `控制导航栏下方阴影的大小` |
| `shadowColor` | `Color` | `控制导航栏下方阴影的颜色` |
| `shape` | `ShapeBorder` | `导航栏的形状以及阴影` |
| `backgroundColor` | `Color` | `导航栏的背景颜色` |
| `foregroundColor` | `Color` | `导航栏中文本和图标的颜色` |
| `iconTheme` | `IconThemeData` | `导航栏图标的颜色、透明度、大小的配置` |
| `actionsIconTheme` | `IconThemeData` | `导航栏右侧图标的颜色、透明度、大小的配置` |
| automaticallyImplyLeading | bool | 和leading配合使用，如果为true并且leading为空的情况下，会自动配置返回键 |
| textTheme | TextTheme | 导航栏文本的排版样式 |
| primary | bool | 导航栏是否显示在屏幕顶部 |
| excludeHeaderSemantics | bool | 标题是否应该用 [Semantics] 包裹，默认false |
| titleSpacing | double | title内容的间距 |
| toolbarOpacity | double | 导航栏的透明度 |
| bottomOpacity | double | 导航栏底部的透明度 |
| toolbarHeight | double | 导航栏的高度，默认kToolbarHeight |
| toolbarTextStyle | TextStyle | 导航栏图标的颜色 |
| titleTextStyle | TextStyle | 导航栏标题的默认颜色 |
| flexibleSpace | Widget | 堆叠在工具栏和选项卡栏的后面 |
| systemOverlayStyle | SystemUiOverlayStyle | 叠加层的样式 |
| brightness | Brightness | 导航栏的亮度，改属性已废弃，用systemOverlayStyle代替 |

## `2021.12.09 课程目标：`
1. 掌握列表组件ListView与List对象基本用法
2. 掌握第三方库的引入并使用
3. 掌握基本的UI绘制能力（定位、布局、交互）

## `学习资源链接`

- [ListView](https://book.flutterchina.club/chapter6/listview.html)
- [Dart List对象API](https://api.dart.dev/stable/2.15.0/dart-core/List-class.html)
- [flutter_smart_dialog](https://pub.dev/packages/flutter_smart_dialog)
- [flutter_inappwebview](https://pub.dev/packages/flutter_inappwebview)
- [shared_preferences](https://pub.dev/packages/shared_preferences)

## `Dart List数据类型属性与用法`

1. 定义

``` Dart
  // 使用类型推导定义
  var list1 = ['a','b','c','d'];         //初始就赋值，限定了长度，限定了类型，只能是String
  print('$list1, ${list1.runtimeType}'); //[a, b, c, d], List<String>

  // 明确指定类型
  List<int> list2 = [1,2,3,4];           //初始就赋值，限定了长度，限定了类型，只能是int
  print("$list2,${list2.runtimeType}");  //[1, 2, 3, 4],List<int>

  // 其他定义（类型推导定义）
  var list3 = ['x','y','z'];
  var list4 = List();                    //不限定长度，不限定类型，可添加任意类型的数据
  List list5 = List();                   //不限定长度，不限定类型，可添加任意类型的数据
  List list6 = List(2);                  //限定长度为2  越界会报错，不限定类型，可添加任意类型的数据

  // 常见属性
  print(list1.length);                    // 4  获取list1长度
  print(list1.isEmpty);                   // false  字符串是否为空
  print(list1.isNotEmpty);                // true   字符串是否不为空
  print(list1.reversed);                  // (d, c, b, a)   返回一个倒序排列的List，不影响原List;
  print(list1.first);                     // a  第一个元素
  print(list1.last);                      // d  最后一个元素
``` 

2. 常用的方法

``` Dart
  // add方法： 添加元素到末尾
  list1.add('f');
  list2.add(5);
  print('结果：$list1,$list2');            //结果：[a, b, c, d, f],[1, 2, 3, 4, 5]

  // addAll方法： 添加列表内的所有元素到末尾
  list1.addAll(list3);
  print('结果：$list1');                   // 结果：[a, b, c, d, f, x, y, z]
  
  // remove方法：删除指定元素
  list1.remove('a');                       //list1 删除a元素
  print('结果：$list1');                    //结果：[b, c, d, g, x, y, z, f, x, y, z]

  // removeAt方法：删除指定下标的元素
  list1.removeRange(0, 3);                 //list1 删除下标0-3元素
  print('结果：$list1');                    //结果：[x, y, z, f, x, y]

  // removeAt(x) 删除指定下标的元素
  // removeLast() 删除最后一个元素
  // removeRange(x,y) 删除下标范围内的元素
  // contains(value) 是否包含某个元素
  // removeWhere(()=>(bool)) 根据条件删除
  // retainWhere(()=>(bool)) 根据条件筛选元素
  // firstWhere((element) =>(bool), orElse:()=>()) 返回第一个满足条件的元素
  // lastWhere((element) =>(bool), orElse:()=>()) 从后往前查找，返回第一个满足条件的元素
``` 