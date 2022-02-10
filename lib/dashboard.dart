import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'utility.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Material userinfo() {
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
                "Users Information",
                style: TextStyle(color: Colors.black, fontSize: 22),
              ),
              Center(
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.person,
                      color: Colors.teal,
                      size: 120,
                    ),
                    Text(
                      "Name    : ${Variables.userFullName} \nUserID   :  ${Variables.userName} \n UserNo : ${Variables.userID}\nRecords : 3 Transactions\nTodays Date : ${Variables.todayDate}",
                      style: TextStyle(fontSize: 18, color: Colors.teal),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Material myItems(String title, String data, Color color) {
    return Material(
      color: Colors.white,
      elevation: 10.0,
      shadowColor: Color(0x802196f3),
      borderRadius: BorderRadius.circular(24.0),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "$title : $data",
                style: TextStyle(
                  color: color,
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Dashboard Page'),
      ),
      backgroundColor: Colors.teal,
      body: new StaggeredGridView.count(
        padding: EdgeInsets.all(20.0),
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 12.0,
        children: <Widget>[
          userinfo(),
          myItems("Deposite Amount :", Variables.totalDep.toString(),
              Colors.pinkAccent),
          myItems("Loan Amount", Variables.totalLoan.toString(),
              Colors.purpleAccent),
          myItems("Withdraw Amount", Variables.totalWith.toString(),
              Colors.deepPurple),
          myItems("Total Collection Amount", Variables.todaysAmt.toString(),
              Colors.deepOrangeAccent),
        ],
        staggeredTiles: [
          StaggeredTile.extent(2, 260.0),
          StaggeredTile.extent(2, 50.0),
          StaggeredTile.extent(2, 50.0),
          StaggeredTile.extent(2, 50.0),
          StaggeredTile.extent(2, 50.0),
        ],
      ),
    );
  }
}
