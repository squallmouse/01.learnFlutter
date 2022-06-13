import 'package:flutter/material.dart';

// import 'package:flutter_swiper/flutter_swiper.dart';

// --no-sound-null-safety
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(),
      // home: MyHome(),
      routes: {
        '/': (context) => MyHome(),
        '/Page': (context) => Page(),
      },
      initialRoute: '/',
    );
  }
}

///↓↓↓↓↓↓↓↓↓↓↓↓↓**************************************/
///-->主题颜色变换
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
        title: Text("主题颜色变化"),
      ),
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.red,
            width: 4.0,
          ),
          color: Colors.yellow,
        ),
        alignment: Alignment.center,
        child: MaterialButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/Page');
          },
          child: Text("下一页的主题变换"),
          color: Color.fromARGB(255, 180, 135, 188),
        ),
      ),
    );
  }
}

class Page extends StatelessWidget {
  const Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          primaryColor: Colors.green,
          appBarTheme: AppBarTheme(color: Colors.amber)),
      child: Scaffold(
        appBar: AppBar(
          title: Text("主体颜色变换"),
        ),
        body: Container(
          alignment: Alignment.center,
          color: Colors.pink,
          child: Text("页面主体"),
        ),
      ),
    );
  }
}
