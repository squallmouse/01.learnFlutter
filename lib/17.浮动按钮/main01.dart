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
///-->  FloatingActionButton 浮动按钮
///👆🏻*********************************/
//自定义组件

class MyHome extends StatefulWidget {
  MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

//
class _MyHomeState extends State<MyHome> {
  List titleList = ["首页", "推荐", "发布", "商城", "我的"];
  List<Widget> pageList = [
    Page(mytitle: "首页AppBar", msg: "首页的内容"),
    Page(mytitle: "推荐AppBar", msg: "推荐的内容"),
    Page(mytitle: "发布AppBar", msg: "发布的内容"),
    Page(mytitle: "商城AppBar", msg: "商城的内容"),
    Page(mytitle: "我的AppBar", msg: "我的的内容"),
  ];
  var _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("浮动按钮"),
      // ),
      body: this.pageList[this._current],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
        ),
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.all(8),
        child: FloatingActionButton(
          backgroundColor: _current != 2 ? Colors.blue : Colors.pink,
          child: Icon(Icons.add),
          onPressed: () {
            print("点击了浮动按钮");
            setState(() {
              this._current = 2;
            });
          },
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.yellow,
        currentIndex: _current,
        onTap: (index) {
          setState(() {
            _current = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: this.titleList[0],
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.turned_in,
              color: Colors.red,
            ),
            icon: Icon(Icons.turned_in),
            label: this.titleList[1],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: this.titleList[2],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: this.titleList[3],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_alarm),
            label: this.titleList[4],
          ),
        ],
      ),
    );
  }
}

class Page extends StatelessWidget {
  final String mytitle;
  final String msg;
  const Page({this.mytitle = "没有设置title", this.msg = "没有设置内容"});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.mytitle),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text(this.msg),
      ),
    );
  }
}
