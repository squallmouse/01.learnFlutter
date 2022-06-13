import 'package:flutter/material.dart';

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
            "list列表组件",
          ),
        ),
        body: MyHome(), // 封装的主体内容
      ),
    );
  }
}

///↓↓↓↓↓↓↓↓↓↓↓↓↓**************************************/
///-->   list
///👆🏻*********************************/
//自定义以组件

class MyHome extends StatelessWidget {
  List<Widget> listTitleArr = [];

  void setData() {
    for (var i = 0; i < 6; i++) {
      var item = ListTile(
        title: Text(
          "${i}-++-主标题",
          style: TextStyle(
            color: Colors.red,
          ),
        ),
        subtitle: Text("${i}-==-二级标题"),
        leading: Icon(Icons.search), // 前面的图标
        trailing: Icon(Icons.crop_landscape), //后面的图标
      );
      listTitleArr.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    setData();

    return ListView(
      children: listTitleArr,
    );
  }
}
