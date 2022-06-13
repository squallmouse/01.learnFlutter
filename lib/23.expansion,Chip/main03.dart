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
      body: ChipDemo(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("button clicked!!");
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}

//↓↓↓↓↓↓↓↓↓↓↓↓↓**************************************/
///-->   Chip Demo
//👆🏻*********************************/

class ChipDemo extends StatefulWidget {
  ChipDemo({Key? key}) : super(key: key);

  @override
  State<ChipDemo> createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ChipDemoOne(),
          Divider(color: Colors.red),
          FilterChipDemoTwo(),
          Divider(color: Colors.red),
          ChoiceChipDemo(),
          Divider(color: Colors.red),
          ChipDeleteDemo(),
        ],
      ),
    );
  }
}

// ChipDemoOne

class ChipDemoOne extends StatefulWidget {
  ChipDemoOne({Key? key}) : super(key: key);

  @override
  State<ChipDemoOne> createState() => _ChipDemoOneState();
}

class _ChipDemoOneState extends State<ChipDemoOne> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        children: [
          // ---- 1
          Chip(
            label: Text("Chip - 1"),
          ),
          // --- 2
          Chip(
            label: Text("Chip - 2"),
            backgroundColor: Colors.red,
          ),
          //  --- 3
          Chip(
            label: Text("avatar带前标"),
            avatar: CircleAvatar(
              backgroundColor: Colors.orange,
              child: Text("袁"),
            ),
          ),
          //  -- 4
          Chip(
            label: Text("Chip - 4"),
            onDeleted: () {},
            deleteIcon: Icon(Icons.delete_forever),
            deleteIconColor: Colors.redAccent,
            deleteButtonTooltipMessage: "Remove this tag",
          ),
        ],
      ),
    );
  }
}

// FilterChipDemoTwo

class FilterChipDemoTwo extends StatefulWidget {
  FilterChipDemoTwo({Key? key}) : super(key: key);

  @override
  State<FilterChipDemoTwo> createState() => _FilterChipDemoTwo();
}

class _FilterChipDemoTwo extends State<FilterChipDemoTwo> {
  List _tags = ["tag-1", "tag-2", "tag-3"];
  List _selectdList = [];
  String _titleStr = "FilterChip!!";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("FilterChip :  ${_selectdList.toString()}"),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _tags.map((tag) {
              return FilterChip(
                label: Text(tag),
                selected: _selectdList.contains(tag),
                backgroundColor: Colors.green,
                selectedColor: Theme.of(context).primaryColor,
                onSelected: (value) {
                  setState(() {
                    if (_selectdList.contains(tag)) {
                      _selectdList.remove(tag);
                    } else {
                      _selectdList.add(tag);
                    }
                  });
                },
              );
            }).toList(),
          ),

          // 刷新按钮
          Container(
            // color: Colors.pinkAccent,
            margin: EdgeInsets.fromLTRB(80, 0, 80, 0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.lightBlue,
                width: 2,
              ),
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Colors.pink,
            ),
            width: double.infinity,
            child: MaterialButton(
              onPressed: () {
                print("刷新~~~~!!!!");
                setState(() {
                  _selectdList = [];
                });
              },
              child: Text("刷新22"),
            ),
          ),
        ],
      ),
    );
  }
}

// ChoiceChipDemo
class ChoiceChipDemo extends StatefulWidget {
  ChoiceChipDemo({Key? key}) : super(key: key);

  @override
  State<ChoiceChipDemo> createState() => _ChoiceChipDemoState();
}

class _ChoiceChipDemoState extends State<ChoiceChipDemo> {
  List _tags = ["tag-1", "tag-2", "tag-3"];
  List _selectdList = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("ChoiceChip : ${_selectdList.toString()}"),
          Wrap(
            spacing: 8,
            children: _tags.map((e) {
              return ChoiceChip(
                label: Text(_selectdList.contains(e) ? "我被选中了" : e),
                selected: _selectdList.contains(e),
                selectedColor: Colors.red,
                onSelected: (value) {
                  setState(() {
                    // e = value ? "我被选中了" : e;
                    if (_selectdList.contains(e)) {
                      _selectdList.remove(e);
                    } else {
                      _selectdList.add(e);
                    }
                  });
                },
              );
            }).toList(),
          ),
          Container(
            child: MaterialButton(
              onPressed: () {},
              child: Text("刷新"),
            ),
          ),
        ],
      ),
    );
  }
}

// ChipDeleteDemo
class ChipDeleteDemo extends StatefulWidget {
  ChipDeleteDemo({Key? key}) : super(key: key);

  @override
  State<ChipDeleteDemo> createState() => _ChipDeleteDemoState();
}

class _ChipDeleteDemoState extends State<ChipDeleteDemo> {
  String _titleStr = "删除Chip";
  List _chipList = ["删除Chip1", "删除Chip2"];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("删除Chip"),
          // chip
          Wrap(
            spacing: 8,
            children: _chipList.map((e) {
              return Container(
                child: Chip(
                  label: Text(e),
                  deleteIcon: Icon(Icons.delete_forever),
                  deleteIconColor: Colors.black,
                  deleteButtonTooltipMessage: "删除这个Chip",
                  avatar: CircleAvatar(
                    backgroundColor: Colors.green,
                    child: Text("昊"),
                  ),
                  onDeleted: () {
                    setState(() {
                      _chipList.remove(e);
                    });
                  },
                ),
              );
            }).toList(),
          ),

          // 刷新按钮
          MaterialButton(
            onPressed: () {
              setState(() {
                _chipList = ["删除Chip1", "删除Chip2"];
              });
            },
            child: Text("刷新按钮"),
          ),
        ],
      ),
    );
  }
}
