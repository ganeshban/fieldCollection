import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'utility.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void gotoCollectorpage(String title) {
    Navigator.of(context).pushNamed("/LoadUser");
  }

  Material myItems(IconData icon, String title, Color color, String rout,
      {bool isMsg = false, int data = 0}) {
    return Material(
      color: Colors.white,
      elevation: 10.0,
      shadowColor: Color(0x802196f3),
      borderRadius: BorderRadius.circular(24.0),
      child: InkWell(
        splashColor: Colors.tealAccent,
        onTap: () {
          if (isMsg == false) {
            Variables.rptTabIndex = data;
            Navigator.of(context).pushNamed(rout);
          } else {
            DialogMessage.show(
                context, "Will Includ in latter Version", DialogType.okOnly);
          }
        },
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    color: color,
                    fontSize: 20.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 16.0),
                ),
                Material(
                  color: color,
                  borderRadius: BorderRadius.circular(30.0),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Icon(
                      icon,
                      color: Colors.white,
                      size: 30.0,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Home Page"),
        automaticallyImplyLeading: false,
        leading: null,
      ),
      backgroundColor: Colors.teal,
      // body: ListView(
      //   padding: EdgeInsets.all(20.0),

      //   children: <Widget>[
      //     myItems(Icons.dashboard, "Dashboard", Colors.pinkAccent,
      //         '/dashboardPage'),
      //     myItems(Icons.format_align_left, "Report", Colors.teal, '/Report',
      //         data: 0),
      //     myItems(
      //         Icons.attach_money, "Loan Collection", Colors.blue, '/LoanPage'),
      //     myItems(
      //         Icons.attach_money, "Account Collection", Colors.blue, '/Saving'),
      //     myItems(Icons.format_align_left, "Statement", Colors.blue, '/Report',
      //         data: 1),
      //     myItems(Icons.system_update, "Server Management", Colors.pinkAccent,
      //         '/Saving',
      //         isMsg: true),
      //     myItems(Icons.settings, "Setting", Colors.pinkAccent, '/settingPage'),
      //   ],

      //   staggeredTiles: [
      //     StaggeredTile.extent(2, 200.0),
      //     StaggeredTile.extent(1, 220.0),
      //     StaggeredTile.extent(1, 120.0),
      //     StaggeredTile.extent(1, 230.0),
      //     StaggeredTile.extent(1, 130.0),
      //     StaggeredTile.extent(1, 180.0),
      //     StaggeredTile.extent(1, 180.0),
      //   ],
      // ),
      body: ListView(
        children: [
          StaggeredGridView.countBuilder(
            crossAxisCount: 2,
            itemBuilder: (context, index) {
              return myItems(Icons.dashboard, "Dashboard", Colors.pinkAccent,
                  '/dashboardPage');
            },
            staggeredTileBuilder: (index) {
              return StaggeredTile.count(2, 2);
            },
          ),
        ],
      ),
    );
  }
}
