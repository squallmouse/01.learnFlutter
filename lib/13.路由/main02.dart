import 'package:flutter/material.dart';
// import 'package:learn_flutter/08.Stack,Align,Positioned/main01.dart';

import '../0.pages/MySetting.dart';
import '../0.pages/MyCategory.dart';
import '../0.pages/MyHome.dart';

// import 'listData.dart';

void main() {
  runApp(MyApp());
}

///↓↓↓↓↓↓↓↓↓↓↓↓↓**************************************/
///-->  路由  命名路由
/// 路由的使用
/// '/'
///👆🏻*********************************/
//自定义组件
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      routes: {
        '/': (context) => MyTab(),
        '/search': ((context) => SearchPage("Search--2")),
        '/form': (context) => Form(),
      },
      // home: MyTab(),
    );
  }
}

class MyHomeTwo extends StatefulWidget {
  MyHomeTwo({Key? key}) : super(key: key);

  @override
  State<MyHomeTwo> createState() => _MyHomeTwoState();
}

class _MyHomeTwoState extends State<MyHomeTwo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 50,
        ),
        MaterialButton(
          onPressed: () {
            Navigator.pushNamed(context, '/search');
          },
          child: Text("跳转到search页面"),
        ),
      ],
    );
  }
}

class MyTab extends StatefulWidget {
  MyTab({Key? key}) : super(key: key);

  @override
  State<MyTab> createState() => _MyTabState();
}

class _MyTabState extends State<MyTab> {
  List titleList = ["首页", "分类", "设置"];
  List<Widget> _bodyList = [MyHomeTwo(), MyCategory(), MySetting()];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 导航栏
        title: Text(
          titleList[this._currentIndex],
        ),
      ),

      body: this._bodyList[this._currentIndex], // 封装的主体内容

      // 底部的 bottomBar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            this._currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "首页",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "分类",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "设置",
          ),
        ],
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  String _title = "noname";
  // SearchPage({this._title = "没有名字的页面"});
  SearchPage(this._title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${this._title}"),
      ),
      body: Container(
        child: Center(
          child: MaterialButton(
            onPressed: () {
              Navigator.pushNamed(context, '/form');
            },
            child: Text("跳转到form"),
          ),
        ),
        // Text("搜索页面"),
      ),
    );
  }
}

class Form extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('form--'),
      ),
      body: Center(
        child: Container(
          width: 200,
          height: 300,
          color: Colors.yellow,
        ),
      ),
    );
  }
}
