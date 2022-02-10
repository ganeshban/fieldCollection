import 'package:flutter/material.dart';
import 'utility.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

FocusNode pswfocusnode = new FocusNode();
final bool isLogedin = false;
TextEditingController username = new TextEditingController();
TextEditingController password = new TextEditingController();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: gotoCollectorpage,
            itemBuilder: (BuildContext context) {
              return MyMenuItem.option.map((String mymenu) {
                return PopupMenuItem<String>(
                  value: mymenu,
                  child: new Text(mymenu),
                );
              }).toList();
            },
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: ListView(
        children: <Widget>[
          new FlutterLogo(
            size: 100.0,
          ),
          new Padding(
            padding: EdgeInsets.only(top: 5.0),
          ),
          new Form(
            child: new Theme(
              data: new ThemeData(
                  brightness: Brightness.dark,
                  primarySwatch: Colors.teal,
                  inputDecorationTheme: new InputDecorationTheme(
                      labelStyle:
                          new TextStyle(color: Colors.white, fontSize: 18.0))),
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new TextFormField(
                      style: TextStyle(fontSize: 20.0),
                      decoration: new InputDecoration(
                          labelText: 'Enter Your ID', icon: Icon(Icons.person)),
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      controller: username,
                      onFieldSubmitted: (val) =>
                          FocusScope.of(context).requestFocus(pswfocusnode),
                    ),
                    new TextFormField(
                      style: TextStyle(fontSize: 20.0),
                      decoration: new InputDecoration(
                          labelText: 'Enter User Password',
                          icon: Icon(Icons.lock_outline)),
                      keyboardType: TextInputType.number,
                      focusNode: pswfocusnode,
                      textInputAction: TextInputAction.done,
                      obscureText: true,
                      controller: password,
                      onFieldSubmitted: (a) => logIn,
                    ),
                    new Padding(padding: EdgeInsets.only(top: 25.0)),
                    new MaterialButton(
                        color: Colors.teal,
                        height: 50.0,
                        minWidth: 350.0,
                        textColor: Colors.white,
                        splashColor: Colors.tealAccent,
                        child: new Text(
                          'Sign In',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        onPressed: logIn)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void gotoCollectorpage(String menu) {
    Navigator.of(context).pushNamed("/LoadUser");
  }

  void logIn() {
    if (username.text == "123") {
      if (password.text == "123") {
        Navigator.of(context).pushNamed("/Home");
      } else {
        DialogMessage.show(context, "Invalid Password", DialogType.okOnly);
      }
    } else {
      DialogMessage.show(context, "Invalid User ID ", DialogType.okOnly);
    }
  }

  void logIn1() {
    if (username.text == "123") {
      if (password.text == "123") {
        Navigator.of(context).pushNamed("/Home");
      } else {
        DialogMessage.show(context, "Invalid Password", DialogType.okOnly);
      }
    } else {
      DialogMessage.show(context, "Invalid User ID ", DialogType.okOnly);
    }
  }
}

class MyMenuItem {
  static const String menu1 = 'Load Collector';

  static const List<String> option = <String>[menu1];
}

class UserList {
  int userid;
  String username;
  String password;
  String userfullname;

  UserList({this.userid, this.username, this.password, this.userfullname});
}

var users = <UserList>[
  UserList(
      userid: 1,
      username: "123",
      password: "123",
      userfullname: "Ganesh Ban I"),
  UserList(
      userid: 2,
      username: "135",
      password: "135",
      userfullname: "Ganesh Ban II"),
  UserList(
      userid: 3,
      username: "246",
      password: "246",
      userfullname: "Ganesh Ban III"),
  UserList(
      userid: 4,
      username: "579",
      password: "579",
      userfullname: "Ganesh Ban IV"),
  UserList(
      userid: 5,
      username: "321",
      password: "321",
      userfullname: "Ganesh Ban V"),
];
