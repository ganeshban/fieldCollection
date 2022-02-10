import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'utility.dart';

enum lst { dep, withd }

class Savingpage extends StatefulWidget {
  @override
  _SavingpageState createState() => _SavingpageState();
}

lst tranType = lst.dep;

TextEditingController txtAcno = TextEditingController(text: "13-0098649124-00");
TextEditingController txtacName = TextEditingController(text: "Ganesh Ban");
TextEditingController txtBal = TextEditingController(text: "54326.00");
TextEditingController txtAbBal = TextEditingController(text: '53626.00');
TextEditingController txtDep = TextEditingController();
TextEditingController txtwith = TextEditingController();

Material loadbody1() {
  return Material(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20.0),
    elevation: 10,
    child: Padding(
      padding: EdgeInsets.all(12.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Today's History",
              style: TextStyle(color: Colors.black, fontSize: 28.0),
            ),
            TextField(
              enabled: false,
              keyboardType: TextInputType.number,
              controller: txtDep,
              style: TextStyle(color: Colors.teal, fontSize: 20.0),
              decoration: InputDecoration(
                labelText: "Deposite Amount :",
                labelStyle: TextStyle(color: Colors.black, fontSize: 18.0),
              ),
            ),
            TextField(
              enabled: false,
              controller: txtwith,
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.teal, fontSize: 20.0),
              decoration: InputDecoration(
                  labelText: "Withdraw Amount :",
                  labelStyle: TextStyle(color: Colors.black, fontSize: 18.0)),
            ),
          ],
        ),
      ),
    ),
  );
}

Material loadbody() {
  return Material(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20.0),
    elevation: 10,
    child: Padding(
      padding: EdgeInsets.all(12.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Transacion",
              style: TextStyle(color: Colors.black, fontSize: 28.0),
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: txtDep,
              style: TextStyle(color: Colors.teal, fontSize: 20.0),
              onChanged: (val) {
                txtwith.text = "0";
              },
              decoration: InputDecoration(
                labelText: "Deposite Amount :",
                labelStyle: TextStyle(color: Colors.black, fontSize: 18.0),
              ),
            ),
            TextField(
              onChanged: (val) {
                txtDep.text = "0";
              },
              controller: txtwith,
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.teal, fontSize: 20.0),
              decoration: InputDecoration(
                  labelText: "Withdraw Amount :",
                  labelStyle: TextStyle(color: Colors.black, fontSize: 18.0)),
            ),
          ],
        ),
      ),
    ),
  );
}

Material footer(BuildContext context) {
  return Material(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20.0),
    elevation: 10,
    child: InkWell(
      onTap: () {
        if (txtDep.text.isEmpty || txtwith.text.isEmpty) {
          DialogMessage.show(context, "Filds are blank. Please Ensure that.",
              DialogType.okOnly);
        } else if (double.parse(txtDep.text) + double.parse(txtwith.text) >
            Variables.maxTransLimit) {
          DialogMessage.show(
              context, "Transaction Amount is too high", DialogType.okOnly);
        } else if (double.parse(txtDep.text) + double.parse(txtwith.text) <
            Variables.minTransLimit) {
          DialogMessage.show(
              context, "Transaction Amount is too Low", DialogType.okOnly);
        } else if (double.parse(txtwith.text) > double.parse(txtAbBal.text)) {
          DialogMessage.show(
              context,
              "Withdraw Amount is more then minimum Amount.",
              DialogType.okOnly);
        } else if (double.parse(txtwith.text) > Variables.todaysAmt) {
          DialogMessage.show(
              context, "You Wallet is not sufficient.", DialogType.okOnly);
        } else {
          DialogMessage.show(context, "Are You Sure To Perform Transaction ?",
              DialogType.yesno);
          if (DialogMessage.dialogresult == DialogAction.yes) {
            if (double.parse(txtDep.text) > 0) {
              Variables.todaysAmt =
                  Variables.todaysAmt + double.parse(txtDep.text);
              Variables.totalDep =
                  Variables.totalDep + double.parse(txtDep.text);
            } else {
              Variables.todaysAmt =
                  Variables.todaysAmt - double.parse(txtwith.text);
              Variables.totalWith =
                  Variables.totalWith + double.parse(txtwith.text);
            }
            DialogMessage.show(
                context, "Transaction is Saved !!!", DialogType.okOnly);
          }
        }
      },
      splashColor: Colors.tealAccent,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Save Record',
              style: TextStyle(
                  color: Colors.teal,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    ),
  );
}

Material header() {
  return Material(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20.0),
    shadowColor: Color(0x802196f3),
    elevation: 10,
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              "Account Info",
              style: TextStyle(color: Colors.black, fontSize: 28.0),
            ),
            TextField(
              enabled: false,
              controller: txtAcno,
              style: TextStyle(color: Colors.teal, fontSize: 20.0),
              decoration: InputDecoration(
                labelText: "Account Number :",
                labelStyle: TextStyle(color: Colors.black, fontSize: 18.0),
              ),
            ),
            TextField(
              enabled: false,
              controller: txtacName,
              style: TextStyle(color: Colors.teal, fontSize: 20.0),
              decoration: InputDecoration(
                  labelText: "Account Name :",
                  labelStyle: TextStyle(color: Colors.black, fontSize: 18.0)),
            ),
            TextField(
              enabled: false,
              controller: txtBal,
              style: TextStyle(color: Colors.teal, fontSize: 20.0),
              decoration: InputDecoration(
                  labelText: "Balance Rs. :",
                  labelStyle: TextStyle(color: Colors.black, fontSize: 18.0)),
            ),
            TextField(
              enabled: false,
              controller: txtAbBal,
              style: TextStyle(color: Colors.teal, fontSize: 20.0),
              decoration: InputDecoration(
                  labelText: "Available Balance Rs. :",
                  labelStyle: TextStyle(color: Colors.black, fontSize: 18.0)),
            ),
          ],
        ),
      ),
    ),
  );
}

class _SavingpageState extends State<Savingpage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Collectin Page'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.of(context).pushNamed('/searchPage');
            },
          )
        ],
      ),
      backgroundColor: Colors.teal,
      body: StaggeredGridView.count(
        padding: EdgeInsets.all(16.0),
        crossAxisCount: 2,
        mainAxisSpacing: 12.0,
        crossAxisSpacing: 12.0,
        children: <Widget>[header(), loadbody(), loadbody1(), footer(context)],
        staggeredTiles: [
          StaggeredTile.extent(2, 300.0),
          StaggeredTile.extent(1, 180.0),
          StaggeredTile.extent(1, 180.0),
          StaggeredTile.extent(2, 50.0)
        ],
      ),
    );
  }
}
