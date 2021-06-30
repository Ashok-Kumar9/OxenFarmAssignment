import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ShowPickedCompanies extends StatefulWidget {
  static const String id = 'showPickedCompanies';

  @override
  _ShowPickedCompaniesState createState() => _ShowPickedCompaniesState();
}

class _ShowPickedCompaniesState extends State<ShowPickedCompanies> {
  final String _baseUrl = 'https://api.stocktwits.com/api/2/watchlists/show/';
  //Add the token here
  final String _token = '5ed70ea1a0565456ce28008d086fbf6bf4655bd7';
  // Add the id of the watchlist whose company list we want to show
  final String _watchlistId = '4701439';

  late Future data;

  @override
  void initState() {
    super.initState();
    data = showPickedComp();
  }

  // for getting the data of companies picked in the watchlist
  Future showPickedComp() async {
    Future data;
    String url = '$_baseUrl$_watchlistId.json?access_token=$_token';
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Companies Picked'),
      ),
      body: Center(
        child: Container(
          child: FutureBuilder(
            future: data,
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
