import 'dart:async';
import 'dart:io';
import 'dart:math' as maths;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';


String userID="";
String userEmail="";
String userPassword="";
String userDP="";
String userName="";
String userType="";
Map userCart={};
bool userCartFetchedOnce=false;

String fireToken="";

String serverRoot="https://smallhurry.com.ng";
String serverAuthLink="$serverRoot/small-hurry/app-auth.php";
String serverRequestLink="$serverRoot/small-hurry/requests.php";
String otherProcessesLink="$serverRoot/small-hurry/other-processes.php";
String bikerLink="$serverRoot/small-hurry/biker.php";
String paystackLink="$serverRoot/small-hurry/paystack.php";

String appLocalRoot="";

Color veryLightBlue=const Color.fromRGBO(200, 200, 230, 1);
Color logoBlue= const Color(0xFF222856);
Color logoBlue2= const Color(0xFF171E52);
Color logoGreen= const Color(0xFF73AB22);

RegExp emailExp= RegExp(r"^[a-z_0-9.-]+\@[a-z_0-9-]+\.[a-z_0-9-]+(\.[a-z_0-9-]+)*$", caseSensitive: false);
RegExp digitExp= RegExp(r"^\d+$");
RegExp doubleExp= RegExp(r"^[0-9.]+$");
RegExp endingDecimalZeros=RegExp(r"0*$");
RegExp trailingDot=RegExp(r"\.$");
RegExp htmlTagExp = RegExp(r"<[^>]*>", multiLine: true);

Duration tapDelay= const Duration(milliseconds: 400);

String noInternet="Kindly ensure that your device is properly connected to the internet";
String gapiKey="AIzaSyAWBrkX5iwHKWIOrutkJFJca5tYQ-ql0Jo";
String gMapDirAPIEndpoint="https://maps.googleapis.com/maps/api/directions/json";

Future<Database> dbConnect()async{
  Database dbCon= await openDatabase(
      "main.db",
      version: 1,
      onCreate: (Database db, int v)async{
        db.execute("create table table_list (id integer primary key, table_name text)");
      }
  );
  List<String> tableNames= <String>[];
  List tableRes= await dbCon.rawQuery("select * from table_list");
  for(Map ele in tableRes){
    tableNames.add(ele["table_name"]);
  }
  if(!tableNames.contains("user_li")){
    dbCon.execute("insert into table_list (table_name) values ('user_li')");
    dbCon.execute("create table user_li (id integer primary key, user_id text, full_name text, email text, password text, dp text, status text, u_type text)");
  }

  if(!tableNames.contains("key_val")){
    dbCon.execute("insert into table_list (table_name) values ('key_val')");
    dbCon.execute("create table key_val (id integer primary key, key text, val text)").then((value){
      dbCon.execute("insert into key_val (key, val) values ('page', 'intro')");
    });
  }

  return dbCon;
}//db connect

String activeTab="home";
Size defBtnSize= Size.zero;
Offset defBtnPos=Offset.zero;

List<Size> tabBtnSize= [Size.zero, Size.zero];
List<Offset> tabBtnPos=[Offset.zero, Offset.zero];
bool shouldMoveTab=false;
final StreamController tabPosCtr= StreamController.broadcast();

getHomeRect(){
  shouldMoveTab=false;
  tabBtnSize.removeAt(0);
  tabBtnSize.add(defBtnSize);
  tabBtnPos.removeAt(0);
  tabBtnPos.add(defBtnPos);
  Future.delayed(const Duration(milliseconds: 50), (){
    shouldMoveTab=true;
    tabPosCtr.add("kjut");
  });
}

kAlertDialog(BuildContext context, String title, String content, List<Map> actions, {Widget? contentBody}){
  if(Platform.isAndroid){
    showDialog(
        context: context,
        builder: (BuildContext ctx){
          return AlertDialog(
            title: Text(
              title
            ),
            content: contentBody ?? Text(
              content
            ),
            actions: List.generate(actions.length, (index) {
              Map targAction= actions[index];
              return TextButton(
                  onPressed: targAction["action"],
                  style: TextButton.styleFrom(
                    primary: targAction["color"] ?? Colors.black54
                  ),
                  child: Text(
                    targAction["text"]
                  )
              );
            }),
          );
        }
    );
  }
  else if(Platform.isIOS){
    showCupertinoDialog(
        context: context,
        builder: (BuildContext ctx){
          return CupertinoAlertDialog(
            title: Text(
                title
            ),
            content: contentBody ?? Text(
                content
            ),
            actions: List.generate(actions.length, (index) {
              Map targAction= actions[index];
              return CupertinoDialogAction(
                  onPressed: targAction["action"],
                  textStyle: TextStyle(
                    color: targAction["color"] ?? Colors.black54
                  ),
                  child: Text(
                      targAction["text"]
                  )
              );
            }),
          );
        }
    );
  }
}

double calcGradient(double x1, double y1, double x2, double y2){
  return (y2 - y1)/ (x2 - x1);
}

double rad2Deg(double rad){
  return (rad* 180)/ maths.pi;
}

double deg2Rad(deg){
  return (deg * maths.pi)/180;
}

Map productCats= {};
//List storeDistricts=[];
//List warehouses=[];
List stores=[];

Map activeAddress={};
String eta="";