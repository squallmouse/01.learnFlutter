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

class ExpansionItem {
  final String headTitle;
  final Widget body;
  bool isExpanded;

  ExpansionItem({
    required this.headTitle,
    required this.body,
    required this.isExpanded,
  });
}

class ExpansionDemo extends StatefulWidget {
  ExpansionDemo({Key? key}) : super(key: key);

  @override
  State<ExpansionDemo> createState() => _ExpansionDemoState();
}

class _ExpansionDemoState extends State<ExpansionDemo> {
  List<ExpansionItem> _expansionItemList = [];
  @override
  void initState() {
    super.initState();
    _expansionItemList = [
      // ExpansionItem(headTitle : "Expansion -- A", body:Container(), isExpanded : false)
      ExpansionItem(
        headTitle: "Expansion -- A",
        body: Container(
          alignment: Alignment.center,
          child: Text("下翻的内容 ExpansionPanel 的 body -- A"),
          width: double.infinity,
        ),
        isExpanded: false,
      ),
      ExpansionItem(
        headTitle: "Expansion -- B",
        body: Container(
          alignment: Alignment.center,
          child: Text("下翻的内容 ExpansionPanel 的 body -- B"),
          width: double.infinity,
        ),
        isExpanded: false,
      ),
      ExpansionItem(
        headTitle: "Expansion -- C",
        body: Container(
          alignment: Alignment.center,
          child: Text("下翻的内容 ExpansionPanel 的 body -- C"),
          width: double.infinity,
        ),
        isExpanded: false,
      ),
    ];
  }

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
              setState(() {
                _expansionItemList[panelIndex].isExpanded = !isExpanded;
              });
            },
            children: _expansionItemList.map((ExpansionItem item) {
              return ExpansionPanel(
                headerBuilder: (context, isExpanded) {
                  return Container(
                    child: Text(item.headTitle),
                  );
                },
                body: item.body,
                isExpanded: item.isExpanded,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
