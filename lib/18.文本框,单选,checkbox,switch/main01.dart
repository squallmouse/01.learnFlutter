import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHome());
  }
}

///↓↓↓↓↓↓↓↓↓↓↓↓↓**************************************/
///-->  TextField 文本框
///👆🏻*********************************/
//自定义组件

class MyHome extends StatefulWidget {
  MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

//
class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextField文本框组件"),
      ),
      body: Container(
        color: Colors.amber,
        alignment: Alignment.center,
        child: MyTextField(),
      ),
    );
  }
}

// TextField 文本框

class MyTextField extends StatefulWidget {
  MyTextField({Key? key}) : super(key: key);

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      // height: 100,
      color: Colors.green,
      child: TextField(
        onChanged: (value) {
          print(value);
        },
        maxLines: 1, // >0
        // obscureText: true, // 密码框
        decoration: InputDecoration(
          hintText: "placeholder",
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
