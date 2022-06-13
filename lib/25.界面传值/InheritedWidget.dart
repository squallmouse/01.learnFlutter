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
      body: TestDemo(),
    );
  }
}

//↓↓↓↓↓↓↓↓↓↓↓↓↓**************************************/
///-->   界面传值
///基本使用
//👆🏻*********************************/

class TestDemo extends StatefulWidget {
  TestDemo({Key? key}) : super(key: key);

  @override
  State<TestDemo> createState() => _TestDemoState();
}

class _TestDemoState extends State<TestDemo> {
  int _count = 0;

  _pressFunc() {
    setState(() {
      _count += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      count: _count,
      increaseCount: _pressFunc,
      child: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ChipDemo(),
            IconButton(
              color: Colors.cyan[300],
              onPressed: _pressFunc,
              icon: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}

// ChipDemo

class ChipDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int index = CounterProvider.of(context)!.count;
    final VoidCallback _callback = CounterProvider.of(context)!.increaseCount;
    return Container(
      child: ActionChip(
        label: Text("${index}"),
        onPressed: _callback,
        // onDeleted: _callback,
      ),
    );
  }
}

class CounterProvider extends InheritedWidget {
  final int count;
  final VoidCallback increaseCount;
  final Widget child;

  CounterProvider(
      {required this.count, required this.increaseCount, required this.child})
      : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true; // true 允许传值
  }

  static CounterProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterProvider>();
  }
}


//

