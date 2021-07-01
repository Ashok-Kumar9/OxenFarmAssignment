import 'package:flutter/material.dart';
import 'package:oxenfarmassign/Screens/login_screen.dart';
import 'package:oxenfarmassign/Screens/show_watchlists.dart';
import 'package:oxenfarmassign/Screens/showPickedCompanies.dart';
import 'package:oxenfarmassign/changeNotifier.dart';
import 'package:oxenfarmassign/getCode.dart';
import 'package:oxenfarmassign/getToken.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppData(),
      child: MyApp(),
    ),
  );
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
          GetCode.id: (context) => GetCode(),
          GetToken.id: (context) => GetToken(),

        });
  }
}
