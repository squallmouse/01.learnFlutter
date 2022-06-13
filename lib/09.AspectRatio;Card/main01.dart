import 'package:flutter/material.dart';

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
///-->  AspectRatio
/// 在布局限制条件允许的范围内尽可能的扩展, widget 的高度是由宽度和 比例决定的
/// 按照固定比率去尽量占满区域.
///👆🏻*********************************/
//自定义以组件

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100, // 高为 100
      color: Colors.yellow,
      child: AspectRatio(
        aspectRatio: 16.0 / 9.0, // 按照16:9 高是100
        child: Container(
          color: Colors.red,
        ),
      ),
    );
  }

}
