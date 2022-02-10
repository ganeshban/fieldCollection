import 'package:flutter/material.dart';
import 'Homepage.dart';
import 'LoanPage.dart';
import 'dashboard.dart';
import 'login.dart';
import 'report.dart';
import 'saving_collection.dart';
import 'selectuser.dart';
import 'seachpage.dart';
import 'setting.dart';

void main() {
  runApp(
    MaterialApp(
      title: "nMobSystem", //nepolianMobileCollectionSystem
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
          primarySwatch: Colors.teal, brightness: Brightness.light),
      home: LoginPage(),
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => new LoginPage(),
        '/Saving': (BuildContext context) => new Savingpage(),
        '/Home': (BuildContext context) => new HomePage(),
        '/LoadUser': (BuildContext context) => new LoadUser(),
        '/searchPage': (BuildContext context) => new SearchPage(),
        '/settingPage': (BuildContext context) => new Settingpage(),
        '/dashboardPage': (BuildContext context) => new Dashboard(),
        '/LoanPage': (BuildContext context) => new LoanPage(),
        '/Report': (BuildContext context) => new Report(),
      },
    ),
  );
}
