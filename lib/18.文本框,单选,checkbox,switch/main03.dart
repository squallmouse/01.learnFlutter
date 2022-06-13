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
///-->   checkbox checkboxtile
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
        child: MyCheckbox(),
      ),
    );
  }
}

// Checkbox 文本框

class MyCheckbox extends StatefulWidget {
  MyCheckbox({Key? key}) : super(key: key);

  @override
  State<MyCheckbox> createState() => _MyCheckboxState();
}

class _MyCheckboxState extends State<MyCheckbox> {
  bool _isSelected = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isSelected = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Row(
            children: [
              Text("Checkbox"),
              Checkbox(
                value: _isSelected,
                onChanged: (v) {
                  setState(() {
                    this._isSelected = v!;
                  });
                },
                activeColor: Colors.blue,
                checkColor: Colors.red,
              ),
            ],
          ),
          SizedBox(height: 20),
          CheckboxListTile(
            value: _isSelected,
            onChanged: (value) {
              setState(() {
                _isSelected = value!;
              });
            },
            title: Text("listtile -- title"),
            subtitle: Text("listtile -- subtitle"),
            activeColor: Colors.pink,
            selected: _isSelected,
            secondary:
                Image.network("https://www.itying.com/images/flutter/1.png"),
          )
        ],
      ),
    );
  }
}
