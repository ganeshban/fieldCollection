import 'package:flutter/material.dart';
import 'utility.dart';

class Report extends StatefulWidget {
  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> with SingleTickerProviderStateMixin {
  TabController _tb;

  @override
  void initState() {
    super.initState();
    _tb = new TabController(
        vsync: this, initialIndex: Variables.rptTabIndex, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Report Page [${Variables.todayDate}]"),
        bottom: new TabBar(
          controller: _tb,
          indicatorColor: Colors.teal,
          tabs: <Widget>[
            new Tab(text: "Report"),
            new Tab(text: "Statement"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tb,
        children: <Widget>[
          new ReportPage(),
          new StatementPage(),
        ],
      ),
    );
  }
}

//--------------------------------------------------------------------
class ReportPage extends StatefulWidget {
  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            Text(
              "Report  Page ",
              style: TextStyle(fontSize: 25.0),
            )
          ],
        ),
      ),
    );
  }
}
//------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------

class StatementPage extends StatefulWidget {
  @override
  _StatementPageState createState() => _StatementPageState();
}

class _StatementPageState extends State<StatementPage> {
  TextEditingController txtdata = new TextEditingController();
  String data = "Report Page";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              controller: txtdata,
              onChanged: (val) {
                data = ConvertNumber.toEng(int.parse(val));
                data = ConvertNumber.str;
                print(data);
              },
            ),
            Text(data),
          ],
        ),
      ),
    );
  }
}
