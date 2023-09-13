import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import './globals.dart' as globals;

class PrivacyPolicy extends StatefulWidget{
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PrivacyPolicy();
  }
}

class _PrivacyPolicy extends State<PrivacyPolicy>{
  Size _screenSize= Size.zero;
  @override
  Widget build(BuildContext context) {
    _screenSize=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Privacy Policy"
        ),
        backgroundColor: globals.logoBlue,
        centerTitle: true,
        elevation: 0,
      ),
      body: Stack(
        children: [
          SizedBox(
            width: _screenSize.width,
            height: _screenSize.height,
            child: InAppWebView(
              initialUrlRequest: URLRequest(
                  url: Uri.parse(_initialLink)
              ),
              onLoadStop: (ctr, uri){
                ctr.injectCSSCode(source: "#masthead,#formilla-frame,iframe,#main .elementor-column.elementor-col-50.elementor-top-column.elementor-element.elementor-element-1ca378b,.site-footer{display:none !important; opacity: 0 !important; visibility: hidden !important}");
                _privacyLoadState="complete";
                if(mounted){
                  _privacyLoaderCtr.add("kjut");
                }
              },
              onLoadError: (_, __, ___, ____){
                _privacyLoadState="error";
                if(mounted){
                  _privacyLoaderCtr.add("kjut");
                }
              },
            ),
          ),
          StreamBuilder(
              stream: _privacyLoaderCtr.stream,
              builder: (BuildContext ctx, AsyncSnapshot snapshot){
                if(_privacyLoadState == "complete"){
                  return Container();
                }
                Widget loadStateCue= Transform.translate(
                  offset: const Offset(0, -100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator.adaptive(valueColor: AlwaysStoppedAnimation(Colors.black54),),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 12),
                        child: const Text(
                            "Loading ..."
                        ),
                      )
                    ],
                  ),
                );
                if(_privacyLoadState == "error"){
                  loadStateCue= const Text(
                    "We encountered an error display the privacy document",
                    textAlign: TextAlign.center,
                  );
                }
                return Positioned(
                    left: 0,
                    top: 0,
                    width: _screenSize.width,
                    height: _screenSize.height,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white
                      ),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: loadStateCue,
                    )
                );
              }
          )
        ],
      ),
    );
  }

  final String _initialLink="https://shop.smallhurry.com/privacy-policy/";
  final StreamController _privacyLoaderCtr= StreamController.broadcast();
  String _privacyLoadState="loading";
  @override
  void dispose() {
    _privacyLoaderCtr.close();
    super.dispose();
  }
}