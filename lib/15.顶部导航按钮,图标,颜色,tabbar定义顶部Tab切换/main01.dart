import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

///↓↓↓↓↓↓↓↓↓↓↓↓↓**************************************/
///-->  AppBar
///IconButton
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            print("menu pressed");
          },
          tooltip: "Search",
        ),
        title: Text("Flutter Demo"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print("menu search");
            },
            tooltip: "search",
          ),
          IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: () {
              print("menu more_horiz");
            },
            tooltip: "more_horiz",
          ),
        ],
      ),
      body: Text("这是AppBar"),
    );
  }
}
