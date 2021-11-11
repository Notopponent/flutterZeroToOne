# zeroapp

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## 深入浅出组件

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