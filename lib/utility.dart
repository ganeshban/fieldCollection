import 'package:flutter/material.dart';

enum DialogAction { yes, no, ok }
enum DialogType { okOnly, yesno }

enum SnackbarAction { ok }

class DialogMessage {
  static DialogAction dialogresult;
  static Future<DialogAction> show(
    BuildContext context,
    String body,
    DialogType dialogtype,
  ) {
    final action = showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            height: (MediaQuery.of(context).size.height / 2.2),
            width: (MediaQuery.of(context).size.width / 2.6),
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
            child: Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 6.32,
                  decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0))),
                  child: Center(
                      child: FlutterLogo(
                    size: 80.0,
                  )),
                ),
                Padding(padding: EdgeInsets.only(top: 8.0)),
                Container(
                  padding: EdgeInsets.all(8.0),
                  height: MediaQuery.of(context).size.height / 5.14,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          body,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    //crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      dialogtype == DialogType.okOnly
                          ? MaterialButton(
                              onPressed: () {
                                dialogresult = DialogAction.ok;
                                Navigator.of(context).pop();
                              },
                              child: Text("Ok",
                                  style: TextStyle(
                                      fontSize: 25.0, color: Colors.teal)),
                            )
                          : Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  MaterialButton(
                                    onPressed: () {
                                      dialogresult = DialogAction.yes;
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      "Yes",
                                      style: TextStyle(
                                          fontSize: 25.0, color: Colors.teal),
                                    ),
                                  ),
                                  MaterialButton(
                                    onPressed: () {
                                      dialogresult = DialogAction.no;
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      "No",
                                      style: TextStyle(
                                          fontSize: 25.0, color: Colors.teal),
                                    ),
                                  )
                                ],
                              ),
                            ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0))),
                ),
              ],
            ),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        );
      },
    );
    return (action != null)
        ? action
        : (dialogtype == DialogType.okOnly ? DialogAction.ok : DialogAction.no);
  }
}

class ConvertNumber {
  static String str;
  static String tmp;
  static double i;
  static int j;

  static one() {
    if (i < 10 || i % 10 == 0) {
      str = str + " ";
    } else {
      str = str + "-";
    }
    switch (i.toInt() % 10) {
      case 9:
        str = str + "Nine";
        break;
      case 8:
        str = str + "Eight";
        break;
      case 7:
        str = str + "Seven";
        break;
      case 6:
        str = str + "Six";
        break;
      case 5:
        str = str + "Five";
        break;
      case 4:
        str = str + "Four";
        break;
      case 3:
        str = str + "Three";
        break;
      case 2:
        str = str + "Two";
        break;
      case 1:
        str = str + "One";
        break;
    }
  }

  static tens() {
    switch (i.toInt() % 100) {
      case 90 - 99:
        str = str + " Ninety";
        one();
        break;
      case 80 - 89:
        str = str + " Eighty";
        one();
        break;
      case 70 - 79:
        str = str + " Seventy";
        one();
        break;
      case 60 - 69:
        str = str + " Sixty";
        one();
        break;
      case 50 - 59:
        str = str + " Fifty";
        one();
        break;
      case 40 - 49:
        str = str + " Fourty";
        one();
        break;
      case 30 - 39:
        str = str + " Thirty";
        one();
        break;
      case 20 - 29:
        str = str + " Twenty";
        one();
        break;
      case 19:
        str = str + " Nineeen";
        break;
      case 18:
        str = str + " Eighteen";
        break;
      case 17:
        str = str + " Seventeen";
        break;
      case 16:
        str = str + " Sixteen";
        break;
      case 15:
        str = str + " Fifteen";
        break;
      case 14:
        str = str + " Fourteen";
        break;
      case 13:
        str = str + " Thirteen";
        break;
      case 12:
        str = str + " Twelve";
        break;
      case 11:
        str = str + " Eleven";
        break;
      case 10:
        str = str + " Ten";
        break;
    }
  }

  static hun() {
    if (i > 99) {
      j = i.toInt();
      i = i / 100;
      one();
      str = str + " Hundred";
      i = j.toDouble() % 100;
    }
    if (i != 0) {
      tens();
    }
  }

  static toEng(int number) {
    tmp = number.toString();
    str = '';
    switch (tmp.length) {
      case 14:
        str = "";
        break;
      case 0:
        str = "Zero";
        break;
    }
    i = double.parse(tmp.substring(0, 1));

    if (i != 0) {
      hun();
      str = str + " Kharba";
    }
    i = double.parse(tmp.substring(2, 3));

    if (i != 0) {
      hun();
      str = str + " Arba";
    }
    i = double.parse(tmp.substring(4, 5));

    if (i != 0) {
      hun();
      str = str + " Crore";
    }
    i = double.parse(tmp.substring(6, 7));

    if (i != 0) {
      hun();
      str = str + " Lakhs";
    }
    i = double.parse(tmp.substring(8, 9));

    if (i != 0) {
      hun();
      str = str + " Thousand";
    }
    i = double.parse(tmp.substring(10, 12));

    if (i != 0) {
      hun();
    }
  }
}

class Variables {
  static var maxTransLimit = 200000.0;
  static var minTransLimit = 20.0;
  static var todaysAmt = 0.0;
  static var totalDep = 0.0;
  static var totalWith = 0.0;
  static var totalLoan = 0.0;
  static var printBill = false;
  static var orgName = "Abc Company And Pra. Ltd.";
  static var orgAddress = "Gaindakot-8, Nawalparasi";
  static var userName = "123";
  static var userID = 1;
  static var userFullName = "Ganesh Ban I";
  static var todayDate = "2076-01-22";
  static var rptTabIndex = 0;
}
