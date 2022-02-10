import 'package:flutter/material.dart';
import 'utility.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class LoanPage extends StatefulWidget {
  @override
  _LoanPageState createState() => _LoanPageState();
}

TextEditingController txtdata = TextEditingController();
TextEditingController txtAcName = TextEditingController(text: "Ganesh Ban");
TextEditingController txtAcNo = TextEditingController(text: "13-2653297-02");
TextEditingController txtDue = TextEditingController(text: "2,50,000.00");
TextEditingController txtOverDue = TextEditingController(text: "0.00");
TextEditingController txtPenal = TextEditingController(text: "0.00");
TextEditingController txtInterest = TextEditingController(text: "0.00");
TextEditingController txtDiscount = TextEditingController(text: "0.00");
TextEditingController txtinstallment = TextEditingController(text: "50000.00");
TextEditingController txtPayable = TextEditingController(text: "0.00");

double lablesize = 15;
double textsize = 16;
double headersize = 18;
DialogAction xx;

Material loadbody() {
  return Material(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20.0),
    elevation: 10,
    child: Padding(
      padding: EdgeInsets.all(12.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              "Transacion",
              style: TextStyle(color: Colors.black, fontSize: headersize),
            ),
            TextField(
              controller: txtdata,
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.teal, fontSize: textsize),
              decoration: InputDecoration(
                  labelText: "Loan Amount :",
                  labelStyle:
                      TextStyle(color: Colors.black, fontSize: lablesize)),
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
    elevation: 8,
    child: InkWell(
      onTap: () {
        if (txtdata.text.isEmpty) {
          DialogMessage.show(context, "Filds are blank. Please Ensure that.",
              DialogType.okOnly);
        } else if (double.parse(txtdata.text) > Variables.maxTransLimit) {
          DialogMessage.show(
              context, "Transaction Amount is too high", DialogType.okOnly);
        } else if (double.parse(txtdata.text) < Variables.minTransLimit) {
          DialogMessage.show(
              context, "Transaction Amount is too Low", DialogType.okOnly);
        } else if (double.parse(txtdata.text) > double.parse(txtdata.text)) {
          DialogMessage.show(
              context,
              "Withdraw Amount is more then minimum Amount.",
              DialogType.okOnly);
        } else {
          Variables.totalLoan =
              Variables.totalLoan + double.parse(txtdata.text);
          Variables.todaysAmt =
              Variables.todaysAmt + double.parse(txtdata.text);
          DialogMessage.show(
              context, "Transaction Save Succesfully.", DialogType.okOnly);
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              "Account Info",
              style: TextStyle(color: Colors.black, fontSize: headersize),
            ),
            TextField(
              enabled: false,
              controller: txtAcNo,
              style: TextStyle(color: Colors.teal, fontSize: textsize),
              decoration: InputDecoration(
                labelText: "Account Number :",
                labelStyle: TextStyle(color: Colors.black, fontSize: lablesize),
              ),
            ),
            TextField(
              enabled: false,
              controller: txtAcName,
              style: TextStyle(color: Colors.teal, fontSize: textsize),
              decoration: InputDecoration(
                  labelText: "Account Name :",
                  labelStyle:
                      TextStyle(color: Colors.black, fontSize: lablesize)),
            ),
            TextField(
              enabled: false,
              controller: txtDue,
              style: TextStyle(color: Colors.teal, fontSize: textsize),
              decoration: InputDecoration(
                  labelText: "Due Principle :",
                  labelStyle:
                      TextStyle(color: Colors.black, fontSize: lablesize)),
            ),
            TextField(
              enabled: false,
              controller: txtOverDue,
              style: TextStyle(color: Colors.teal, fontSize: textsize),
              decoration: InputDecoration(
                  labelText: "Over Due Principle :",
                  labelStyle:
                      TextStyle(color: Colors.black, fontSize: lablesize)),
            ),
            TextField(
              enabled: false,
              controller: txtPenal,
              style: TextStyle(color: Colors.teal, fontSize: textsize),
              decoration: InputDecoration(
                  labelText: "Penal Amount :",
                  labelStyle:
                      TextStyle(color: Colors.black, fontSize: lablesize)),
            ),
            TextField(
              enabled: false,
              controller: txtInterest,
              style: TextStyle(color: Colors.teal, fontSize: textsize),
              decoration: InputDecoration(
                  labelText: "Interest Amount:",
                  labelStyle:
                      TextStyle(color: Colors.black, fontSize: lablesize)),
            ),
            TextField(
              enabled: false,
              controller: txtDiscount,
              style: TextStyle(color: Colors.teal, fontSize: textsize),
              decoration: InputDecoration(
                  labelText: "Discount Amount:",
                  labelStyle:
                      TextStyle(color: Colors.black, fontSize: lablesize)),
            ),
            TextField(
              enabled: false,
              controller: txtinstallment,
              style: TextStyle(color: Colors.teal, fontSize: textsize),
              decoration: InputDecoration(
                  labelText: "Installment Amount :",
                  labelStyle:
                      TextStyle(color: Colors.black, fontSize: lablesize)),
            ),
            TextField(
              enabled: false,
              controller: txtPayable,
              style: TextStyle(color: Colors.teal, fontSize: textsize),
              decoration: InputDecoration(
                  labelText: "Total Payable Amount:",
                  labelStyle:
                      TextStyle(color: Colors.black, fontSize: lablesize)),
            ),
          ],
        ),
      ),
    ),
  );
}

class _LoanPageState extends State<LoanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Loan Collectin Page'),
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
        padding: EdgeInsets.all(10.0),
        crossAxisCount: 2,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        children: <Widget>[header(), loadbody(), footer(context)],
        staggeredTiles: [
          StaggeredTile.extent(2, 540.0),
          StaggeredTile.extent(2, 100.0),
          StaggeredTile.extent(2, 50.0),
        ],
      ),
    );
  }
}
