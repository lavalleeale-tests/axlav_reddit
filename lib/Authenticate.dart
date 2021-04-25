import 'package:flutter/material.dart';
import 'package:oauth2_client/oauth2_helper.dart';
import 'Reddit_oauth2_client.dart';

RedditOauth2Client client = RedditOauth2Client(
  customUriScheme:
      'com.axlav.reddit', //Must correspond to the AndroidManifest's "android:scheme" attribute
  redirectUri:
      'com.axlav.reddit://oauth2redirect', //Can be any URI, but the scheme part must correspond to the customeUriScheme
);

OAuth2Helper oauth2Helper = OAuth2Helper(client,
    grantType: OAuth2Helper.AUTHORIZATION_CODE,
    clientId: 'gksNg5pQqAs2_Q',
    clientSecret: "",
    scopes: ['identity', 'read'],
    authCodeParams: {"duration": "permanent"},
    enablePKCE: false);

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ElevatedButton(
          onPressed: () {
            oauth2Helper.getToken().then((value) => {Navigator.pop(context)});
          },
          child: Text("Login")),
      ElevatedButton(
          onPressed: () {
            oauth2Helper
                .removeAllTokens()
                .then((value) => {Navigator.pop(context)});
          },
          child: Text("Logout"))
    ]);
  }
}
