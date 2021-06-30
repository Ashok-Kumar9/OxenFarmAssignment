import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:oxenfarmassign/Screens/showPickedCompanies.dart';

class ShowWatchlist extends StatefulWidget {
  static const String id = 'show_WatchList';

  @override
  _ShowWatchlistState createState() => _ShowWatchlistState();
}

class _ShowWatchlistState extends State<ShowWatchlist> {
  final String _baseUrl = 'https://api.stocktwits.com/api/2/watchlists.json';

  // Add the id of the watchlist whose company list we want to show
  final String _token = '5ed70ea1a0565456ce28008d086fbf6bf4655bd7';
  late Future data;

  @override
  void initState() {
    super.initState();
    data = getData();
  }

  Future getData() async {
    Future data;
    String url = '$_baseUrl?access_token=$_token';
    Watchlist watchlist = Watchlist(url);
    data = watchlist.fetchWatchList();
    return data;
  }

  Widget createList(List data, BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ListTile(
            title: Text(data[0]['name'].toString()),
            leading: Container(
              padding: EdgeInsets.all(5),
              color: Colors.black,
              child: Text('Id: ${data[0]['id'].toString()}',
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
            subtitle: Text(data[0]['updated_at'].toString()),
            onTap: () {
              Navigator.pushNamed(
                context,
                ShowPickedCompanies.id,
              );
            },
          ),
          Divider(
            color: Colors.black,
            thickness: 1,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WatchList'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              child: FutureBuilder(
                  future: data,
                  builder: (context, AsyncSnapshot snapshot) {
                    return snapshot.hasData
                        ? createList(snapshot.data['watchlists'], context)
                        : CircularProgressIndicator();
                  }),
            ),
            SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  ShowPickedCompanies.id,
                );
              },
              child: Text('Show Companies'),
            ),
          ],
        ),
      ),
    );
  }
}

class Watchlist {
  final String url;
  Watchlist(this.url);

  Future fetchWatchList() async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}
