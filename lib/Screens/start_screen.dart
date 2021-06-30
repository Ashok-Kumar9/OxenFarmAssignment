import 'package:flutter/material.dart';
import 'package:oxenfarmassign/Screens/show_watchlists.dart';
import 'package:oxenfarmassign/Components/roundedButton.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              child: Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            RoundedButton(
                color: Colors.lightBlueAccent,
                textOnButton: 'Get Started',
                onPressed: () async {
                  Navigator.popAndPushNamed(context, ShowWatchlist.id);
                }),
          ],
        ),
      ),
    );
  }
}
