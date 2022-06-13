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
///   columns : 列   List<DataColumn>
///      rows : 行   List<DataRow>
//👆🏻*********************************/

class _Bean {
  final int id;
  final String name;
  final String type;

  _Bean(this.id, this.name, this.type);
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

  final columns = ["id", "名称", "类型"];
  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: columns.map((e) {
        return DataColumn(label: Text(e));
      }).toList(),
      rows: data.map((e) {
        return DataRow(
          cells: [
            DataCell(Text("${e.id}")),
            DataCell(Text("${e.name}")),
            DataCell(Text("${e.type}")),
          ],
        );
      }).toList(),
    );
  }
}
