import 'package:flutter/material.dart';
import '../12.BottomNavigationBar/main01.dart';

class MyForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('form--'),
      ),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 50),
          MaterialButton(
            onPressed: () {
              // 返回上一级页面
              Navigator.of(context).pop();
            },
            child: Text("返回上一级页面"),
            color: Colors.red,
          ),
          SizedBox(height: 100),
          MaterialButton(
            onPressed: () {
              // 本页面(第三级页面)变换成了根页面 ,
              // 再点击左上角返回按键, 返回到第二级页面
              Navigator.of(context).pushReplacementNamed('/');
            },
            child: Text("本页面变成了根页面,但还是第三级页面"),
            color: Colors.green,
          ),
          SizedBox(height: 64),
          MaterialButton(
            onPressed: () {
              // 本页面(第三级页面) 返回了 根页面
              Navigator.of(context).pushAndRemoveUntil(
                new MaterialPageRoute(
                  builder: (context) => new MyTab(count: 0),
                ),
                (route) => route == null,
              );
              // Navigator.of(context).pushAndRemoveUntil(
              //   new MaterialPageRoute(
              //     builder: (context) => Test(),
              //   ),
              //   (route) => route == null,
              // );
            },
            child: Text("返回根页面"),
            color: Colors.green,
          ),
        ],
      )),
    );
  }
}

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("test"),
      ),
      body: Container(
        color: Colors.amber,
        child: Text("Test 页面"),
      ),
    );
  }
}
