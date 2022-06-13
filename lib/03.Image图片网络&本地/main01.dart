import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

///↓↓↓↓↓↓↓↓↓↓↓↓↓**************************************/
///-->   image 网络获取图片
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
        child: Image.network(
          "http://www.ionic.wang/statics/index/images/ionic4.png",
          fit: BoxFit.cover,
        ),
        width: 300,
        height: 300,
        decoration: BoxDecoration(
          color: Colors.red,
        ),
      ),
    );
  }
}
