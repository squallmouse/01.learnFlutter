import 'package:flutter/material.dart';

class MySetting extends StatefulWidget {
  MySetting({Key? key}) : super(key: key);

  @override
  State<MySetting> createState() => _MySettingState();
}

class _MySettingState extends State<MySetting> {
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 400,
        color: Colors.green,
        alignment: Alignment.centerRight,
        child: Row(
          children: [
            Text("设置页面的${this._count}次改变"),
            SizedBox(
              width: 50,
            ),
            MaterialButton(
              child: Text(
                "dataChange",
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                setState(() {
                  this._count++;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
