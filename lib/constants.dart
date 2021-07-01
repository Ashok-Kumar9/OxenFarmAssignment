import 'package:flutter/material.dart';

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

const kTextFieldDecoration = InputDecoration(
  hintText: '',
  hintStyle: TextStyle(color: Colors.blueGrey),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.lightBlueAccent,
      width: 2.0,
    ),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

final String kClientId = '5d65c7fa33d9444e';
final String kSecretId = '66f59c664799ca6c8809f53034173b841d7276fd';
final String kAuthorizeUrl = 'https://api.stocktwits.com/api/2/oauth/authorize';
final String kRequestTokenUrl = 'https://api.stocktwits.com/api/2/oauth/token';
final String kDomain = 'https://www.dummysite.com';
final String kWatchlistUrl = 'https://api.stocktwits.com/api/2/watchlists.json';
final String kShowWatchlistUrl = 'https://api.stocktwits.com/api/2/watchlists/show/';
