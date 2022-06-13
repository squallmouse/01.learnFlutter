import 'package:flutter/material.dart';
import 'package:FlutterDemo/08.Stack,Align,Positioned/main01.dart';

// import 'listData.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(home: MyTab());
  }
}

class MyTab extends StatefulWidget {
  MyTab({Key? key}) : super(key: key);

  @override
  State<MyTab> createState() => _MyTabState();
}

class _MyTabState extends State<MyTab> {
  List titleList = ["首页", "分类", "设置"];
  List<Widget> _bodyList = [MyHome(), MyCategory(), MySetting()];
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

///↓↓↓↓↓↓↓↓↓↓↓↓↓**************************************/
///-->  路由  MaterialPageRoute
/// 基本路由的使用
///  Navigator.of(context).push(
// MaterialPageRoute(
//   builder: (context) {
//     return SearchPage("搜索的AppBar");
//   },
// ),
//);
///👆🏻*********************************/
//自定义组件

class MyHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyHome();
}

class _MyHome extends State<MyHome> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
        ),
        Text("点击了${this.count}次按钮"),
        SizedBox(height: 30),
        MaterialButton(
          child: Text("跳转到搜索页面"),
          color: Colors.pink,
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return SearchPage("搜索的AppBar");
                },
              ),
            );
          },
        ),
      ],
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
        child: Text("搜索页面"),
      ),
    );
  }
}

class MyCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("分类页面"),
      ),
    );
  }
}

class MySetting extends StatefulWidget {
  MySetting({Key? key}) : super(key: key);

  @override
  State<MySetting> createState() => _MySettingState();
}

class _MySettingState extends State<MySetting> {
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 400,
        color: Colors.green,
        alignment: Alignment.centerRight,
        child: Row(
          children: [
            Text("设置页面的${this._count}次改变"),
            SizedBox(
              width: 50,
            ),
            MaterialButton(
              child: Text(
                "dataChange",
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                setState(() {
                  this._count++;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
