import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

TextEditingController txtsearch = new TextEditingController();

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: TextField(
          autofocus: true,
          controller: txtsearch,
          textInputAction: TextInputAction.search,
          style: TextStyle(color: Colors.white),
          keyboardType: TextInputType.number,
          decoration: new InputDecoration(
            hintText: "Search .. . .",
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white),
          ),
        ),
        actions: <Widget>[
          new IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              txtsearch.text = "";
            },
          )
        ],
      ),
    );
  }
}
