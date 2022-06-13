import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHome());
  }
}

///↓↓↓↓↓↓↓↓↓↓↓↓↓**************************************/
///-->  Drawer 侧边栏
///可以手动滑出,也可以通过点击按钮显示
///   drawer: Drawer(child: Text("左边侧边栏")),
///   endDrawer: Drawer(child: Text("右边侧边栏")),
///👆🏻*********************************/
//自定义组件

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer 侧边栏"),
      ),
      drawer: Drawer(child: Text("左边侧边栏")),
      endDrawer: Drawer(child: Text("右边侧边栏")),
    );
  }
}
