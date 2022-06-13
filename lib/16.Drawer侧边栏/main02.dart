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
///-->  DrawerHeader 侧边栏头部
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
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              // 装饰器
              decoration: BoxDecoration(
                color: Colors.yellow,
                image: DecorationImage(
                  image: NetworkImage(
                      "https://www.itying.com/images/flutter/1.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: ListView(
                children: [Text("我是一个头部!!!")],
              ),
            ),
            ListTile(
              title: Text("个人中心"),
              leading: CircleAvatar(
                child: Icon(Icons.people),
              ),
            ),
            Divider(),
            ListTile(
              title: Text("系统设置"),
              leading: CircleAvatar(
                child: Icon(Icons.settings),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
