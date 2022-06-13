import 'package:flutter/material.dart';

// import 'listData.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
///-->   GridView
/// GridView.counter
///👆🏻*********************************/
//自定义以组件

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyData data = MyData(); // 获取数据

    return GridView.count(
      children: data.getListData(), // 获取数据

      crossAxisCount: 2, // 有多少列
      crossAxisSpacing: 20.0, //左右之间的距离
      mainAxisSpacing: 10.0, // 主轴 上下之间的距离
      padding: EdgeInsets.all(10.0),

      childAspectRatio: 0.618, // 宽高的比例
    );
  }
}

class MyData {
// title
// author
//imageUrl

  List<Widget> getListData() {
    List<Widget> list = [];

    for (var i = 0; i < 20; i++) {
      var temp = Container(
        child: Text(
          "这是第${i}个container",
          maxLines: 2,
          style: TextStyle(
            color: Colors.blue[600],
            fontSize: 20,
          ),
        ),
        alignment: Alignment.center,
        color: Color.fromARGB(255, 234, 191, 48),
      );

      list.add(temp);
    }

    return list;
  }
}
