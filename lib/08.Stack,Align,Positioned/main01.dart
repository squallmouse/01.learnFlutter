
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
///-->  stack
/// 里面的元素会按照  放入的顺序  堆叠在一起
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
            Text("第1个text",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            Text("第2个text!!!!!!!!!!!!",
              style: TextStyle(
                color: Colors.green,
              ),
            ),
            Text("第3个text~~~~~~~~~",
              style: TextStyle(
                color: Colors.yellow,
              ),
            ),

          ],
        ),
      ),
    );
  }
}




