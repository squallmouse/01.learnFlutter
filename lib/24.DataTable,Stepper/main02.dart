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
      body: DateTableDemo(),
    );
  }
}

//↓↓↓↓↓↓↓↓↓↓↓↓↓**************************************/
///-->   DataTable
///基本使用
//👆🏻*********************************/

class _Bean {
  final int id;
  final String name;
  final String type;
  bool select;

  _Bean(this.id, this.name, this.type, {this.select = false});

  @override
  String toString() {
    return "_Bean {id= $id ,name= $name , type= $type, select= $select}";
  }
}

class DateTableDemo extends StatefulWidget {
  DateTableDemo({Key? key}) : super(key: key);

  @override
  State<DateTableDemo> createState() => _DateTableDemoState();
}

class _DateTableDemoState extends State<DateTableDemo> {
  final data = [
    _Bean(101, "DataTable", "StatelessWidget"),
    _Bean(44, "RangeSlider", "StatefulWidget"),
    _Bean(2, "Text", "StatelessWidget"),
    _Bean(1, "Image", "StatefulWidget"),
    _Bean(131, "DataTable--2", "StatelessWidget"),
    _Bean(424, "RangeSlider--2", "StatefulWidget"),
    _Bean(23, "Text--2", "StatelessWidget"),
    _Bean(16, "Image--2", "StatefulWidget"),
  ];

  // final columns = ["id", "名称", "类型"];

  List<_Bean> _selectData = [];

  _onSelectAll(bool? select) {
    setState(() {
      if (select!) {
        // data.forEach((element) => element.select = true);
        _selectData = data.map((e) {
          e.select = true;
          return e;
        }).toList();
      } else {
        data.forEach((element) => element.select = false);
        _selectData = [];
      }
      //
    });
  }

  bool _sortAscending = false;
  _onSortId(int index, bool ascending) {
    setState(() {
      print("ascending = ${ascending}");
      //
      _sortAscending = ascending;
      //false : 降序 ,,,,, true : 升序;;
      data.sort(
          (a, b) => ascending ? a.id.compareTo(b.id) : b.id.compareTo(a.id));
    });
  }

  @override
  Widget build(BuildContext context) {
    return DataTable(
      // 是否升序排序 true:升序  false:降序 ;
      sortAscending: _sortAscending,
      // 第几列进行排序
      sortColumnIndex: 1,
      // 每一列的 标题
      columns: [
        DataColumn(
          label: Checkbox(
            value: _selectData.length == data.length,
            onChanged: _onSelectAll,
          ),
        ),
        DataColumn(
          label: Text("id"),
          numeric: true, // 箭头: true 在前 : false 在后
          onSort: _onSortId, // 排列的方法
        ),
        DataColumn(label: Text("名称")),
        DataColumn(label: Text("类型")),
      ],
      // 每一行的内容
      rows: data.map((e) {
        return DataRow(
          cells: [
            DataCell(
              Container(
                child: Checkbox(
                  value: e.select,
                  onChanged: (bool? value) {
                    setState(() {
                      e.select = value!;
                      if (value) {
                        _selectData.add(e);
                      } else {
                        _selectData.remove(e);
                      }
                    });
                  },
                ),
              ),
            ),
            DataCell(Text("${e.id}")),
            DataCell(Text("${e.name}")),
            DataCell(Text("${e.type}")),
          ],
        );
      }).toList(),
    );
  }
}
