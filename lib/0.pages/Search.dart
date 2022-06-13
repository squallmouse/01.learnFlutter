import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  String _title = "noname";
  final Map? arg;

  // SearchPage(this._title);
  // SearchPage(this._title);
  SearchPage({this.arg});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${this.arg?["title"]}"),
      ),
      body: Container(
        child: Center(
          child: MaterialButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/form',
              );
            },
            child: Text("跳转到form -- ${this.arg!["ID"]}"),
          ),
        ),
        // Text("搜索页面"),
      ),
    );
  }
}
