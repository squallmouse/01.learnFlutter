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
    return MaterialApp(
        home: MyTab(
      count: 0,
    ));
  }
}

///↓↓↓↓↓↓↓↓↓↓↓↓↓**************************************/
///-->  BottomNavigationBar
/// 底部导航条 , 可以让我们底部Tab切换,
/// bottomNavigationBar是Scaffold组件的参数
///👆🏻*********************************/
//自定义组件
class MyTab extends StatefulWidget {
  MyTab({Key? key, required int count}) : super(key: key);

  @override
  State<MyTab> createState() => _MyTabState();
}

class _MyTabState extends State<MyTab> {
  List titleList = ["首页", "分类", "设置"];
  List<Widget> _bodyList = [MyHome(), MyCategory(), MySetting()];
  int _currentIndex = 0;
  // var _changePage = (int index){
  //   setState(() {
  //     this._currentIndex = index;
  //   });
  // };
  void _changerPage(int index) {
    setState(() {
      this._currentIndex = index;
    });
  }

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
        onTap: _changerPage,
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

///////

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
          child: Text("按钮"),
          color: Colors.pink,
          onPressed: () {
            setState(() {
              // 把改变的数据渲染到页面上
              this.count++;
            });

            print(this.count);
          },
        )
      ],
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
