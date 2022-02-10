import 'package:flutter/material.dart';
import 'utility.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Settingpage extends StatefulWidget {
  @override
  _SettingpageState createState() => _SettingpageState();
}

TextEditingController txtOrgName =
    TextEditingController(text: Variables.orgName.toString());
TextEditingController txtOrgAdd =
    TextEditingController(text: Variables.orgAddress.toString());
TextEditingController txtMinAmt =
    TextEditingController(text: Variables.minTransLimit.toString());
TextEditingController txtMaxAmt =
    TextEditingController(text: Variables.maxTransLimit.toString());

class _SettingpageState extends State<Settingpage> {
  bool chkboxstate = Variables.printBill;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Setting Page [${Variables.todayDate}]"),
        actions: <Widget>[
          new IconButton(
            icon: Icon(Icons.filter_none),
            onPressed: () {
              Variables.maxTransLimit = double.parse(txtMaxAmt.text);
              Variables.minTransLimit = double.parse(txtMinAmt.text);
              Variables.orgAddress = txtOrgAdd.text;
              Variables.orgName = txtOrgName.text;
              Variables.printBill = chkboxstate;

              Navigator.of(context).pop();
            },
          )
        ],
      ),
      // backgroundColor: Colors.teal,
      body: StaggeredGridView.count(
        padding: EdgeInsets.all(6.0),
        crossAxisCount: 4,
        mainAxisSpacing: 6.0,
        crossAxisSpacing: 6.0,
        children: <Widget>[
          new TextField(
              enabled: false,
              controller: txtOrgName,
              decoration: InputDecoration(
                labelText: "Orginazation Name",
              )),
          new TextField(
            enabled: false,
            controller: txtOrgAdd,
            decoration: InputDecoration(labelText: "Orginazation Address"),
          ),
          new TextField(
            controller: txtMinAmt,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Min Amount"),
          ),
          new TextField(
            controller: txtMaxAmt,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Max Amount"),
          ),
          CheckboxListTile(
            onChanged: (bool chk) {
              setState(() {
                chkboxstate = chk;
              });
            },
            value: chkboxstate,
            title: Text("Print Bill"),
          )
        ],
        staggeredTiles: [
          StaggeredTile.extent(4, 50.0),
          StaggeredTile.extent(4, 50.0),
          StaggeredTile.extent(1, 50.0),
          StaggeredTile.extent(1, 50.0),
          StaggeredTile.extent(2, 50.0),
        ],
      ),
    );
  }
}
