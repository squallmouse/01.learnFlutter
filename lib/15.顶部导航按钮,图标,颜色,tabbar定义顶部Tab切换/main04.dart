import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

///↓↓↓↓↓↓↓↓↓↓↓↓↓**************************************/
///-->  tabbar 切换
///实现tabs的另一种方法
///DefaultTabController : length : 2 , child :
///tabbar : 各种属性
///  with SingleTickerProviderStateMixin
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

class MyHome extends StatefulWidget {
  MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> with SingleTickerProviderStateMixin {
  //
  late TabController _tabController;
  //

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  //
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("顶部tab切换"),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(icon: Icon(Icons.pedal_bike)),
            Tab(icon: Icon(Icons.view_array_rounded)),
            Tab(icon: Icon(Icons.holiday_village_outlined)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(child: Text("自行车")),
          Center(child: Text("第二页面")),
          Center(child: Text("第三页面")),
        ],
      ),
    );
  }
}
