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
///-->  stack  positioned
///Stack 组件中结合 Positioned 组件也可以控制每个子元素的显示位置
///👆🏻*********************************/
//自定义以组件

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 400,
        width: 300,
        color: Colors.pink,
        child: Stack(
          children: [
            Positioned(
              top: 40.0,
              left: 40,
              child: Text(
                "第1个text",
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
            Positioned(
              top: 200,
              left: 100,
              child: Text(
                "第2个text",
                style: TextStyle(
                  color: Colors.yellow,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Text(
                "第3个text",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
