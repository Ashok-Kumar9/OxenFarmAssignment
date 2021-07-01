import 'package:flutter/cupertino.dart';

class AppData extends ChangeNotifier {
  final Map<String, String> appData = {};

  void addData(String a, String b) {
    appData[a] = b;
    notifyListeners();
  }
}
