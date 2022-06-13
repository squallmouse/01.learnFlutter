import 'package:flutter/material.dart';
// import 'package:learn_flutter/08.Stack,Align,Positioned/main01.dart';

import '../0.pages/MySetting.dart';
import '../0.pages/MyCategory.dart';
import '../0.pages/MyHome.dart';
import '../0.routes/routes.dart';

// import 'listData.dart';

void main() {
  runApp(MyApp());
}

///↓↓↓↓↓↓↓↓↓↓↓↓↓**************************************/
///-->  路由  返回 Form页面里面
///1. // 返回上一级页面
// Navigator.of(context).pop();
///
///2,  替换路由
///// 本页面(第三级页面)变换成了根页面 ,
// 再点击左上角返回按键, 返回到第二级页面
/// Navigator.of(context).pushReplacementNamed('/');
///
///3.// 本页面(第三级页面) 返回了 根页面
///pushAndRemoveUntil 把前面所有的路由都移除 直到到达括号中所写的路由
// Navigator.of(context).pushAndRemoveUntil(
//   new MaterialPageRoute(
//     builder: (context) => new MyTab(count: 0),// 根路由 不一定非要有参数
//   ),
//   (route) => route == null, // 把前面所有的页面都置为null
// );
///👆🏻*********************************/
//自定义组件
class MyApp extends StatelessWidget {
  var myroute = MyRoute();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyTab(),
      onGenerateRoute: myroute.onGenerateRoute,
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
            Navigator.pushNamed(context, '/search',
                arguments: {"title": "search!!", 'ID': 20});
          },
          child: Text("跳转到search页面"),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class MyTab extends StatefulWidget {
  int count;
  MyTab({this.count = 0});

  @override
  State<MyTab> createState() => _MyTabState(this.count);
}

class _MyTabState extends State<MyTab> {
  int count;
  _MyTabState(this.count) {
    this._currentIndex = this.count;
  }

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

// class SearchPage extends StatelessWidget {
//   String _title = "noname";
//   final Map? arg;

//   // SearchPage(this._title);
//   // SearchPage(this._title);
//   SearchPage({this.arg});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("${this.arg?["title"]}"),
//       ),
//       body: Container(
//         child: Center(
//           child: MaterialButton(
//             onPressed: () {
//               Navigator.pushNamed(
//                 context,
//                 '/form',
//               );
//             },
//             child: Text("跳转到form -- ${this.arg!["ID"]}"),
//           ),
//         ),
//         // Text("搜索页面"),
//       ),
//     );
//   }
// }
