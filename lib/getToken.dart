import 'package:flutter/material.dart';
import 'package:oxenfarmassign/Screens/show_watchlists.dart';
import 'package:oxenfarmassign/changeNotifier.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:oxenfarmassign/constants.dart';

class GetToken extends StatefulWidget {
  static const String id = 'test_screenB';
  @override
  _GetTokenState createState() => _GetTokenState();
}

class _GetTokenState extends State<GetToken> {
  String clientId = kClientId;
  String domain = kDomain;
  String authorizeUrl = kAuthorizeUrl;
  late String myUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Access Token'),
      ),
      backgroundColor: Colors.white,
      body: WebView(
        initialUrl:
            '$authorizeUrl?client_id=$clientId&response_type=token&redirect_uri=$domain&scope=read,watch_lists',
        javascriptMode: JavascriptMode.unrestricted,
        navigationDelegate: (NavigationRequest request) {
          if (request.url
              .startsWith('https://www.dummysite.com/#access_token=')) {
            Provider.of<AppData>(context, listen: false)
                .addData('myToken', request.url.substring(40));
            Navigator.popAndPushNamed(context, ShowWatchlist.id);
          }
          return NavigationDecision.navigate;
        },
      ),
    );
  }
}
