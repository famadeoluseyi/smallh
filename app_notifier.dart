
import 'dart:async';

import 'package:flutter/material.dart';

class GlobalAppNotifier extends StatefulWidget{
  final BuildContext parentContext;
  const GlobalAppNotifier(Key? key, this.parentContext) : super(key: key);
  @override
  GlobalAppNotifierState createState()=> GlobalAppNotifierState();
}

class GlobalAppNotifierState extends State<GlobalAppNotifier>{

  @override
  initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _parentSize=widget.parentContext.size as Size;
      if(_streamController.isClosed == false){
        _streamController.add("kjut");
      }
    });
  }//route's init state

  Size _parentSize= Size.zero;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _streamController.stream,
        builder: (BuildContext ctx, AsyncSnapshot snapshot){
          return AnimatedPositioned(
            left: _parentSize.width * .05,
              top: _showMessage ? 70 : _parentSize.height * .6,
              width: _parentSize.width * .9,
              duration: _displaySpeed,
              curve: Curves.easeOutBack,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 600),
                opacity: _showMessage ? 1 : 0,
                child: IgnorePointer(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: _bgColor,
                        boxShadow: const [
                          BoxShadow(
                              blurStyle: BlurStyle.outer,
                              color: Colors.black26,
                              blurRadius: 5
                          )
                        ]
                    ),
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: _messageIcon,
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(left: 12),
                            child: Text(
                              _notificationMessage,
                              style: TextStyle(
                                  color: _fontColor,
                                  fontSize: 16
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
          );
        }
    );
  }//route's build method

  Duration _displaySpeed= const Duration(milliseconds: 700);
  Color _bgColor= Colors.white;
  Color _fontColor=Colors.black87;
  bool _showMessage=false;
  String _notificationMessage="";
  bool _showing=false;
  Widget _messageIcon= Container();
  showMessage(String message, {Duration? displaySpeed, Color? bgColor, Color? fontColor, Duration duration= const Duration(seconds: 4), Widget? messageIcon}){
    if(_showing == false){
      _showing=true;
      if(displaySpeed!=null){
        _displaySpeed= displaySpeed;
      }
      if(bgColor != null){
        _bgColor=bgColor;
      }
      if(fontColor != null){
        _fontColor=fontColor;
      }
      if(messageIcon == null){
        _messageIcon=Container();
      }
      else{
        _messageIcon= messageIcon;
      }
      _notificationMessage=message;

      _showMessage=true;
      if(!_streamController.isClosed){
        _streamController.add("kjut");
      }
      Future.delayed(duration, (){
        hideMessage();
      });
    }
  }//show message

  hideMessage(){
    _showMessage=false;
    _showing=false;
    if(!_streamController.isClosed){
      _streamController.add("kjut");
    }
  }//hide message

  final StreamController _streamController= StreamController.broadcast();
  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }
}