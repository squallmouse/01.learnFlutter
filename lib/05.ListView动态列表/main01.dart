import 'package:flutter/material.dart';
import 'listData.dart';
// import 'listData.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          // 导航栏
          title: Text(
            "ListView动态列表",
          ),
        ),
        body: MyHome(), // 封装的主体内容
      ),
    );
  }
}

///↓↓↓↓↓↓↓↓↓↓↓↓↓**************************************/
///-->   list
///动态加载
///👆🏻*********************************/
//自定义以组件

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    MyData da = MyData();

    return ListView(
      // scrollDirection: Axis.horizontal,
      children: da.getData(),
    );
  }
}

class MyData {
// title
// author
//imageUrl

  List<Widget> getData() {
    var templist = listData.map((e) {
      return ListTile(
        title: Text(e["title"]),
        subtitle: Text(e["author"]),
        leading: Image.network(e["imageUrl"]),
      );
    });
    return templist.toList();
  }
}
