import 'dart:async';

import 'package:flutter/material.dart';
import 'package:oxenfarmassign/Screens/show_watchlists.dart';
import 'package:oxenfarmassign/Components/roundedButton.dart';
import 'package:oxenfarmassign/changeNotifier.dart';
import 'package:oxenfarmassign/constants.dart';
import 'package:oxenfarmassign/getCode.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showSpinner = false;
  Completer<WebViewController> _controller = Completer<WebViewController>();

  late String? hashCo;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    hashCo = Provider.of<AppData>(context).appData['myUrl'];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              child: Container(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            RoundedButton(
              textOnButton: 'Get Started',
              onPressed: () {
                Navigator.popAndPushNamed(context, GetCode.id);
              },
              color: Colors.lightBlueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
