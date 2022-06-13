import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  Widget nextPage;
  MyHome(this.nextPage);

  @override
  State<StatefulWidget> createState() => _MyHome(this.nextPage);
}

class _MyHome extends State<MyHome> {
  int count = 1;

  Widget nextPage;

  _MyHome(this.nextPage);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
        ),
        Text("点击了${this.count}次按钮"),
        SizedBox(height: 30),
        MaterialButton(
          child: Text("跳转到搜索页面"),
          color: Colors.pink,
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return this.nextPage;
                  // SearchPage("搜索的AppBar");
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
