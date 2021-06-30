import 'package:flutter/material.dart';
import 'package:oxenfarmassign/Screens/start_screen.dart';
import 'package:oxenfarmassign/Screens/show_watchlists.dart';
import 'package:oxenfarmassign/Screens/showPickedCompanies.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: LoginScreen.id,
        routes: {
          LoginScreen.id: (context) => LoginScreen(),
          ShowWatchlist.id: (context) => ShowWatchlist(),
          ShowPickedCompanies.id: (context) => ShowPickedCompanies(),

        });
  }
}
