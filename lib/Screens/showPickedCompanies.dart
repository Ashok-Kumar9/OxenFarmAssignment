import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:oxenfarmassign/constants.dart';
import 'package:provider/provider.dart';

import '../changeNotifier.dart';

class ShowPickedCompanies extends StatefulWidget {
  static const String id = 'showPickedCompanies';

  @override
  _ShowPickedCompaniesState createState() => _ShowPickedCompaniesState();
}

class _ShowPickedCompaniesState extends State<ShowPickedCompanies> {
  final String _baseUrl = kShowWatchlistUrl;
  late String token;
  late final String _watchlistId;

  // for getting the data of companies picked in the watchlist
  Future showPickedComp() async {
    Future data;
    String url = '$_baseUrl$_watchlistId.json?access_token=$token';
    CompanyList watchlist = CompanyList(url);
    data = watchlist.fetchWatchList();
    return data;
  }

  // for creating the ListView to show the list of companies in the watchlist
  Widget createList(List data, BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, int index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ListTile(
                  title: Text(data[index]['symbol'].toString()),
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.green,
                    child: Text(
                      data[index]['id'].toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  subtitle: Text(data[index]['title'].toString()),
                  onTap: () {},
                ),
                Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
              ],
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    token = Provider.of<AppData>(context).appData['myToken'].toString();
    _watchlistId =
        Provider.of<AppData>(context).appData['myWatchlistId'].toString();
    return Scaffold(
      appBar: AppBar(
        title: Text('Companies Picked'),
      ),
      body: Center(
        child: Container(
          child: FutureBuilder(
            future: showPickedComp(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return createList(
                    snapshot.data['watchlist']['symbols'], context);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

class CompanyList {
  final String url;
  CompanyList(this.url);

  Future fetchWatchList() async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}
