import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:oxenfarmassign/changeNotifier.dart';
import 'package:oxenfarmassign/getToken.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:oxenfarmassign/constants.dart';

class GetCode extends StatefulWidget {
  static const String id = 'test_screen';
  @override
  _GetCodeState createState() => _GetCodeState();
}

class _GetCodeState extends State<GetCode> {
  String clientId = kClientId;
  String domain = kDomain;
  String authorizeUrl = kAuthorizeUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Authorization'),
      ),
      backgroundColor: Colors.white,
      body: WebView(
        initialUrl:
            '$authorizeUrl?client_id=$clientId&response_type=code&redirect_uri=$domain&scope=read,watch_lists,publish_watch_lists',
        javascriptMode: JavascriptMode.unrestricted,
        navigationDelegate: (NavigationRequest request) {
          if (request.url.startsWith('https://www.dummysite.com/?code=')) {
            Provider.of<AppData>(context, listen: false)
                .addData('myCode', request.url.substring(40));
            Navigator.popAndPushNamed(context, GetToken.id);
          }
          return NavigationDecision.navigate;
        },
      ),
    );
  }
}
