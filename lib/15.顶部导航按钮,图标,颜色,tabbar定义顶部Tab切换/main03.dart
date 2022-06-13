import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

///↓↓↓↓↓↓↓↓↓↓↓↓↓**************************************/
///-->  tabbar 切换
///实现tabs的另一种方法
///DefaultTabController : length : 2 , child :
///tabbar : 各种属性
///👆🏻*********************************/
//自定义组件
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => print("button click -- "),
            icon: Icon(Icons.home),
            tooltip: "search",
          ),
          title: Row(
            children: [
              Expanded(
                child: TabBar(
                  indicatorColor: Colors.red,
                  isScrollable: true, // 可以滚动, 当tabs 比较多的时候, 可以展开
                  labelColor: Colors.yellow, // 选中颜色
                  unselectedLabelColor: Colors.grey, //未选中颜色

                  tabs: [
                    Tab(text: "热门1"),
                    Tab(text: "推荐2"),
                    Tab(text: "热门3"),
                    Tab(text: "推荐4"),
                    Tab(text: "热门5"),
                    Tab(text: "推荐6"),
                    Tab(text: "热门7"),
                    Tab(text: "推荐8"),
                  ],
                ),
                flex: 1,
              ),
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
            Container(child: Text("33")),
            Container(child: Text("44")),
            Container(child: Text("55")),
            Container(child: Text("66")),
            Container(child: Text("77")),
            Container(child: Text("88")),
          ],
        ),
      ),
    );
  }
}
