import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

import 'firebase_options.dart';

                builder: (BuildContext ctx){
                  return const UserAccount();
                }
            );
          }
          else if(routeSettings.name == "order_history"){
            return CupertinoPageRoute(
                builder: (BuildContext ctx){
                  return const OrderHistory();
                }
            );
          }
          else if(routeSettings.name == "order_detail"){
            String orderID= routeSettings.arguments as String;
            return CupertinoPageRoute(
                builder: (BuildContext ctx){
                  return OrderDetail(orderID: orderID,);
                }
            );
          }
          else if(routeSettings.name == "edit_profile"){
            return CupertinoPageRoute(
                builder: (BuildContext ctx){
                  return const EditProfile();
                }
            );
          }
          else if(routeSettings.name == "update_password"){
            return CupertinoPageRoute(
                builder: (BuildContext ctx){
                  return const UpdatePassword();
                }
            );
          }
          else if(routeSettings.name == "privacy_policy"){
            return CupertinoPageRoute(
                builder: (BuildContext ctx){
                  return const PrivacyPolicy();
                }
            );
          }
          else if(routeSettings.name == "tnc"){
            return CupertinoPageRoute(
                builder: (BuildContext ctx){
                  return const TNC();
                }
            );
          }
          else if(routeSettings.name == "promo"){
            return CupertinoPageRoute(
                builder: (BuildContext ctx){
                  return const Promos();
                }
            );
          }
          return CupertinoPageRoute(
              builder: (BuildContext ctx){
                return const MyHomePage();
              }
          );
        }
        if(routeSettings.name == "intro"){
          return MaterialPageRoute(
              builder: (BuildContext ctx){
                return const Intro();
              }
          );
        }
        else if(routeSettings.name == "register"){
          return MaterialPageRoute(
              builder: (BuildContext ctx){
                return const Register();
              }
          );
        }
        else if(routeSettings.name == "login"){
          return MaterialPageRoute(
              builder: (BuildContext ctx){
                return const Login();
              }
          );
        }
        else if(routeSettings.name == "auth"){
          return MaterialPageRoute(
              builder: (BuildContext ctx){
                return const EmailAuth();
              }
          );
        }
        else if(routeSettings.name == "dash"){
          return MaterialPageRoute(
              builder: (BuildContext ctx){
                return const DashIndex();
              }
          );
        }
        else if(routeSettings.name == "products"){
          String catID= routeSettings.arguments as String;
          return MaterialPageRoute(
              builder: (BuildContext ctx){
                return ProductList(catID: catID,);
              }
          );
        }
        else if(routeSettings.name == "profile"){
          return MaterialPageRoute(
              builder: (BuildContext ctx){
                return const Profile();
              }
          );
        }
        else if(routeSettings.name == "support"){
          return MaterialPageRoute(
              builder: (BuildContext ctx){
                return const Support();
              }
          );
        }
        else if(routeSettings.name == "about"){
          return MaterialPageRoute(
              builder: (BuildContext ctx){
                return const AboutUs();
              }
          );
        }
        else if(routeSettings.name == "faq"){
          return MaterialPageRoute(
              builder: (BuildContext ctx){
                return const FAQ();
              }
          );
        }
        else if(routeSettings.name == "feedback"){
          String pageQuery= routeSettings.arguments as String;
          return MaterialPageRoute(
              builder: (BuildContext ctx){
                return SmallFeedback(pageQuery: pageQuery);
              }
          );
        }
        else if(routeSettings.name == "search"){
          return MaterialPageRoute(
              builder: (BuildContext ctx){
                return const Search();
              }
          );
        }
        else if(routeSettings.name == "address"){
          return MaterialPageRoute(
              builder: (BuildContext ctx){
                return const Address();
              }
          );
        }
        else if(routeSettings.name == "add_location"){
          String locType= routeSettings.arguments.toString();
          return MaterialPageRoute(
              builder: (BuildContext ctx){
                return AddLocation(addressType: locType,);
              }
          );
        }
        else if(routeSettings.name == "product_detail"){
          Map productData= routeSettings.arguments as Map;
          return CupertinoPageRoute(
              builder: (BuildContext ctx){
                return ProductDetail(productData: productData,);
              }
          );
        }
        else if(routeSettings.name == "cart"){
          return CupertinoPageRoute(
              builder: (BuildContext ctx){
                return const Cart();
              }
          );
        }
        else if(routeSettings.name == "checkout"){
          return MaterialPageRoute(
              builder: (BuildContext ctx){
                return const Checkout();
              }
          );
        }
        else if(routeSettings.name == "user_account"){
          return MaterialPageRoute(
              builder: (BuildContext ctx){
                return const UserAccount();
              }
          );
        }
        else if(routeSettings.name == "order_history"){
          return MaterialPageRoute(
              builder: (BuildContext ctx){
                return const OrderHistory();
              }
          );
        }
        else if(routeSettings.name == "order_detail"){
          String orderID= routeSettings.arguments as String;
          return MaterialPageRoute(
              builder: (BuildContext ctx){
                return OrderDetail(orderID: orderID,);
              }
          );
        }

        else if(routeSettings.name == "biker_dash"){
          return MaterialPageRoute(
              builder: (BuildContext ctx){
                return const BikerIndex();
              }
          );
        }
        else if(routeSettings.name == "biker_orders"){
          return MaterialPageRoute(
              builder: (BuildContext ctx){
                return const BikerOrders();
              }
          );
        }
        else if(routeSettings.name == "biker_order_detail"){
          String orderID= routeSettings.arguments as String;
          return MaterialPageRoute(
              builder: (BuildContext ctx){
                return BikerOrderDetail(orderID: orderID,);
              }
          );
        }
        else if(routeSettings.name == "edit_profile"){
          return MaterialPageRoute(
              builder: (BuildContext ctx){
                return const EditProfile();
              }
          );
        }
        else if(routeSettings.name == "update_password"){
          return MaterialPageRoute(
              builder: (BuildContext ctx){
                return const UpdatePassword();
              }
          );
        }
        else if(routeSettings.name == "privacy_policy"){
          return MaterialPageRoute(
              builder: (BuildContext ctx){
                return const PrivacyPolicy();
              }
          );
        }
        else if(routeSettings.name == "tnc"){
          return MaterialPageRoute(
              builder: (BuildContext ctx){
                return const TNC();
              }
          );
        }
        else if(routeSettings.name == "promo"){
          return MaterialPageRoute(
              builder: (BuildContext ctx){
                return const Promos();
              }
          );
        }
        return MaterialPageRoute(
            builder: (BuildContext ctx){
              return const MyHomePage();
            }
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Database _con;
  @override
  initState(){
    super.initState();
    initFCM();
    globals.dbConnect().then((value) {
      _con=value;
    });
    getApplicationDocumentsDirectory().then((value) {
      globals.appLocalRoot=value.path;
    });
  }//route's init state

  initFCM(){
    FirebaseMessaging.onMessage.listen((RemoteMessage msg) async{
      Map msgData= msg.data;
      if(msgData.containsKey("process_as")){
        String processAs= msgData["process_as"];
        String id= msgData["id"];
        List clientOrderList=["order_assigned", "order_trip_started", "order_complete"];
        if(processAs == "biker_selected"){
          AwesomeNotifications().createNotification(content: NotificationContent(
              id: int.parse(id),
              channelKey: "basic_channel",
            title: "New Order",
            body: "You have been selected to deliver an order. Open app to see details"
          ));
        }
        else if(clientOrderList.contains(processAs)){
          AwesomeNotifications().createNotification(content: NotificationContent(
              id: int.parse(id),
              channelKey: "basic_channel",
              title: msgData["label"],
              body: msgData["message"]
          ));
        }
      }
    });
  }


  Future reRoute()async{
    List res= await _con.rawQuery("select * from key_val where key='page' limit 1");
    String page=res[0]["val"];
    if(mounted){
      if(page == "intro"){
        Navigator.of(context).pushReplacementNamed("intro");
      }
      else if(page == "register"){
        Navigator.of(context).pushReplacementNamed("register");
      }
      else if(page == "login"){
        Navigator.of(context).pushReplacementNamed("login");
      }
      else if(page == "dash_index"){
        List userRes= await _con.rawQuery("select * from user_li where status='active' limit 1");
        if(userRes.isNotEmpty){
          globals.userDP=userRes[0]["dp"];
          globals.userID=userRes[0]["user_id"];
          globals.userName=userRes[0]["full_name"];
          globals.userEmail=userRes[0]["email"];
          globals.userPassword=userRes[0]["password"];

          String uType=userRes[0]["u_type"];
          globals.userType=uType;
          if(uType == "user"){
            if(mounted)Navigator.of(context).pushReplacementNamed("dash");
          }
          else if(uType == "biker"){
            if(mounted)Navigator.of(context).pushReplacementNamed("biker_dash");
          }
        }
      }
    }
  }//re-route

  Size _screenSize= Size.zero;
  @override
  Widget build(BuildContext context) {
    _screenSize= MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: _screenSize.width,
        height: _screenSize.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("./images/bg.jpg"),
            fit: BoxFit.cover
          )
        ),
        alignment: Alignment.center,
        child: TweenAnimationBuilder(
          duration: const Duration(milliseconds: 400),
          tween: Tween<double>(begin: 0, end: 1),
          onEnd: (){
            _showName1=true;
            if(_nameAnimCtr.isClosed == false){
              _nameAnimCtr.add("kjut");
            }
          },
          builder: (BuildContext ctx, double twVal, _){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Opacity(
                  opacity: twVal,
                  child: const Image(
                    image: AssetImage("./images/logo.png"),
                    width: 200,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 7, bottom: 2),
                  child: StreamBuilder(
                      stream: _nameAnimCtr.stream,
                      builder: (BuildContext ctx, AsyncSnapshot snapshot){
                        return AnimatedOpacity(
                          opacity: _showName1 ? 1 :0,
                          duration: const Duration(milliseconds: 300),
                          onEnd: (){
                            _showName2=true;
                            if(_nameAnimCtr2.isClosed == false){
                              _nameAnimCtr2.add("kjut");
                            }
                          },
                          child: AnimatedSlide(
                            duration: const Duration(milliseconds: 700),
                            offset: Offset(0, _showName1 ? 0 : 1),
                            curve: Curves.easeInOut,
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                "Fresh and Best",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: globals.logoBlue,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 18
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                  ),
                ),
                StreamBuilder(
                    stream: _nameAnimCtr2.stream,
                    builder: (BuildContext ctx, AsyncSnapshot snapshot){
                      return AnimatedOpacity(
                        opacity: _showName2 ? 1 :0,
                        duration: const Duration(milliseconds: 300),
                        child: AnimatedSlide(
                          duration: const Duration(milliseconds: 700),
                          offset: Offset(0, _showName2 ? 0 : 1),
                          curve: Curves.easeInOut,
                          onEnd: (){
                            reRoute();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              "quality groceries ...",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: globals.logoBlue,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 18
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                )
              ],
            );
          },
        ),
      )
    );
  }//route's build method

  final StreamController _nameAnimCtr= StreamController.broadcast();
  bool _showName1=false;

  final StreamController _nameAnimCtr2= StreamController.broadcast();
  bool _showName2=false;
  @override
  void dispose() {
    _nameAnimCtr.close();
    _nameAnimCtr2.close();
    super.dispose();
  }
}
