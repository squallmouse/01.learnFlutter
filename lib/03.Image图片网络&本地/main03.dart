import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

///↓↓↓↓↓↓↓↓↓↓↓↓↓**************************************/
///-->   圆角图片的另外一种实现 ClipOval
///👆🏻*********************************/
//自定义以组件
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          // 导航栏
          title: Text(
            "image组件;本地&远程",
          ),
        ),
        body: MyHome(), // 封装的主体内容
      ),
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Center(
        child: Container(
      child: ClipOval(
        child: Image.network(
          "http://www.ionic.wang/statics/index/images/ionic4.png",
          width: 300,
          height: 300,
          fit: BoxFit.cover,
        ),
      ),
    ));
  }
}
