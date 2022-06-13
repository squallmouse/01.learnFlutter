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
        title: Text("ExpansionDemo"),
      ),
      body: ExpansionDemo(),
    );
  }
}

//↓↓↓↓↓↓↓↓↓↓↓↓↓**************************************/
///-->   Expansion Demo
//👆🏻*********************************/

class ExpansionDemo extends StatefulWidget {
  ExpansionDemo({Key? key}) : super(key: key);

  @override
  State<ExpansionDemo> createState() => _ExpansionDemoState();
}

class _ExpansionDemoState extends State<ExpansionDemo> {
  @override
  Widget build(BuildContext context) {
    print("ExpansionDemo -- ~~");
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ExpansionPanelList(
            expansionCallback: (panelIndex, isExpanded) {
              print("panelIndex = ${panelIndex}, isExpanded = ${isExpanded}");
            },
            dividerColor: Colors.red,
            children: [
              ExpansionPanel(
                isExpanded: true, // 是否打开
                headerBuilder: (context, isExpanded) {
                  return Container(
                    padding: EdgeInsets.all(10),
                    child: Text("Test"), // 没打开时的 widget
                  );
                },
                //打开后的widget
                body: Container( // 
                  child: ListTile(
                    title: Text("title"),
                    subtitle: Text("subTitle"),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
