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
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ChipDemo"),
      ),
      body: SteamDemo(),
    );
  }
}

//↓↓↓↓↓↓↓↓↓↓↓↓↓**************************************/
///-->   Stream
///基本使用
//👆🏻*********************************/

class SteamDemo extends StatefulWidget {
  SteamDemo({Key? key}) : super(key: key);

  @override
  State<SteamDemo> createState() => _SteamDemoState();
}

class _SteamDemoState extends State<SteamDemo> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("创建一个 Stream");
    Stream<String> _streamDemo = Stream.fromFuture(fetchData());
    print("开始监听 Stream");
    _streamDemo.listen(onData); // 监听 有数据,有错误,完成时
    print("initialize completed");
  }

  void onData(String data) {
    print("${data}");
  }

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 3));
    return "Hello";
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
