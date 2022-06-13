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
///  Map 根据key来找到 对应的方法
/// 命名路由 带参数
///👆🏻*********************************/
//自定义组件
class MyApp extends StatelessWidget {
  final routes = {
    '/': (context) => MyTab(),
    '/search': (context, {arguments}) => SearchPage(arg: arguments),
    '/form': (context) => Form(),
  };
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: MyTab(),

      /*     Navigator.pushNamed(
       context,
       '/search', // setting.name
       arguments: {"title": "search!!", 'ID': 20} // setting.arguments
      );
*/
      /// navigator.push...  生成路由 来到 onGenerateRoute 方法
      ///
/*
const RouteSettings({
    this.name, // String?
    this.arguments, // Object?
  });
*/
      onGenerateRoute: (RouteSettings settings) {
        //统一处理
        String? name = settings.name;
        Function pageContentBuilder = this.routes[name] as Function;
        if (pageContentBuilder != null) {
          if (settings.arguments != null) {
            final Route route = MaterialPageRoute(
                builder: (context) =>
                    pageContentBuilder(context, arguments: settings.arguments));
            return route;
          } else {
            final Route route = MaterialPageRoute(
              builder: (context) => pageContentBuilder(context),
            );
            return route;
          }
        }
        return null;
      },
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
  final Map? arg;

  // SearchPage(this._title);
  // SearchPage(this._title);
  SearchPage({this.arg});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${this.arg?["title"]}"),
      ),
      body: Container(
        child: Center(
          child: MaterialButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/form',
              );
            },
            child: Text("跳转到form -- ${this.arg!["ID"]}"),
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
