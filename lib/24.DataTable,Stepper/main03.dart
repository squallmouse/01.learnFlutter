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
      body: StepperDemo(),
    );
  }
}

//↓↓↓↓↓↓↓↓↓↓↓↓↓**************************************/
///-->   StepperDemo
///基本使用
//👆🏻*********************************/

class StepperDemo extends StatefulWidget {
  StepperDemo({Key? key}) : super(key: key);

  @override
  State<StepperDemo> createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      // color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Theme(
            // data: ThemeData(
            //   canvasColor: Colors.red,
            // ),
            data: ThemeData(
              colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.orange,
              ).copyWith(
                secondary: Colors.green,
              ),
              textTheme: const TextTheme(
                bodyText1: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
            child: Stepper(
              type: StepperType.vertical,
              // 当前被选中的步骤
              currentStep: _currentIndex,
              // 选中步骤~~
              onStepTapped: (int index) {
                print("onStepTapped!!");
                setState(() {
                  _currentIndex = index;
                });
              },
              // 选中继续按钮
              onStepContinue: () {
                print("onStepContinue!!");
                setState(() {
                  _currentIndex < 2 ? _currentIndex += 1 : _currentIndex = 0;
                });
              },

              // 选中取消按钮
              onStepCancel: () {
                print("onStepCancel!!");
                setState(() {
                  _currentIndex > 0 ? _currentIndex -= 1 : _currentIndex = 0;
                });
              },
              //步骤卡
              steps: [
                // 1
                Step(
                  title: Text("step one"),
                  subtitle: Text("step one subtitle"),
                  content: Text("step one content"),
                  isActive: _currentIndex == 0,
                ),
                // 2
                Step(
                  title: Text("step two"),
                  subtitle: Text("step two subtitle"),
                  content: Text("step two content"),
                  isActive: _currentIndex == 1,
                ),
                // 3
                Step(
                  title: Text("step three"),
                  subtitle: Text("step three subtitle"),
                  content: Text("step three content"),
                  isActive: _currentIndex == 2,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
