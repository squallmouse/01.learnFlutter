import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

///↓↓↓↓↓↓↓↓↓↓↓↓↓**************************************/
///-->  tabbar 切换
///顶部切换
///👆🏻*********************************/
//自定义组件
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Demo"),
          bottom: TabBar(
            tabs: [
              Tab(text: "热门"),
              Tab(text: "推荐"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView(
              children: [
                ListTile(title: Text("热门-这是第1个tab")),
                ListTile(title: Text("热门-这是第2个tab")),
                ListTile(title: Text("热门-这是第3个tab"))
              ],
            ),
            ListView(
              children: [
                ListTile(title: Text("推荐-这是第1个tab")),
                ListTile(title: Text("推荐-这是第2个tab")),
                ListTile(title: Text("推荐-这是第3个tab"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
