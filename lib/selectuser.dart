import 'package:flutter/material.dart';

class LoadUser extends StatefulWidget {
  @override
  _LoadUserState createState() => _LoadUserState();
}

class _LoadUserState extends State<LoadUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            //expandedHeight: (MediaQuery.of(context).size.height) / 2 * 0.3,
            pinned: true,
            title: Text("Load Collector"),
          ),
          new SliverList(
            delegate: new SliverChildBuilderDelegate((context, index)=>
            new Card(
              child: new Container(
                padding: EdgeInsets.all(11.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      // backgroundImage: new NetworkImage('https://scontent.fktm3-1.fna.fbcdn.net/v/t1.0-9/11402834_392598300944921_4791788262958915701_n.jpg?_nc_cat=108&_nc_ht=scontent.fktm3-1.fna&oh=362a68ed278965f7b4d4b172d2ff82bb&oe=5D4626BD'),
                    ),
                    new Text('Ganesh Ban')
                  ],
                ),
              ),
            ),
            ),
          )
        ],
      )
    );
  }
}




/*
              slivers: <Widget>[

              new Padding(

                padding: EdgeInsets.only(top: 10.0),
  
              ),
  
              new Text("Abaiable Collector", style: TextStyle(fontSize: 14.0)),
  
              new DataTable(
  
                  columns: <DataColumn>[
  
                    DataColumn(
  
                      label: Text("#"),
  
                      numeric: true,
  
                    ),
  
                    DataColumn(
  
                      label: Text("UserName"),
  
                    ),
  
                    DataColumn(
  
                      label: Text("Full Name"),
  
                    ),
  
                  ],
  
                  rows: users
  
                      .map(
  
                        (userlist) => DataRow(
  
                              cells: [
  
                                DataCell(
  
                                  Text(userlist.id.toString()),
  
                                  showEditIcon: false,
  
                                  placeholder: false,
  
                                ),
  
                                DataCell(
  
                                  Text(userlist.username.toString()),
  
                                  showEditIcon: false,
  
                                  placeholder: false,
  
                                ),
  
                                DataCell(
  
                                  Text(userlist.userfullname.toString()),
  
                                  showEditIcon: false,
  
                                  placeholder: false,
  
                                ),
  
                              ],
  
                            ),
  
                      )
  
                      .toList())
  
            ],
          )

          */

