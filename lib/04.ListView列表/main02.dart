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
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    MyData da = MyData();
    da.setData();

    return ListView(
      children: da.listTitleArr,
    );
  }
}

class MyData {
  List<Widget> listTitleArr = [];

  void setData() {
    for (var i = 1; i <= 4; i++) {
      var item =
          Image.network("https://www.itying.com/images/flutter/${i}.png");

      listTitleArr.add(item);
    }
  }
}
