import 'package:oauth2_client/oauth2_client.dart';

class RedditOauth2Client extends OAuth2Client {
  RedditOauth2Client({String redirectUri = "", String customUriScheme = ""})
      : super(
          authorizeUrl:
              'https://www.reddit.com/api/v1/authorize.compact', //Your service's authorization url
          tokenUrl:
              'https://www.reddit.com/api/v1/access_token', //Your service access token url
          redirectUri: redirectUri,
          customUriScheme: customUriScheme,
          scopeSeparator: ",",
          credentialsLocation: CredentialsLocation.HEADER,
        );
}
