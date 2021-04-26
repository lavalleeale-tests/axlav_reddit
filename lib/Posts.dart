import 'dart:convert';
import 'package:axlav_reddit/api_classes.dart';
import 'package:axlav_reddit/post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:oauth2_client/oauth2_helper.dart';
import 'package:oauth2_client/reddit_oauth_client.dart';

RedditOauth2Client client = RedditOauth2Client(
  customUriScheme:
      'com.axlav.reddit', //Must correspond to the AndroidManifest's "android:scheme" attribute
  redirectUri:
      'com.axlav.reddit://oauth2redirect', //Can be any URI, but the scheme part must correspond to the customeUriScheme
);

OAuth2Helper oauth2Helper = OAuth2Helper(client,
    clientId: 'gksNg5pQqAs2_Q',
    clientSecret: "",
    scopes: ['identity', 'read'],
    authCodeParams: {"duration": "permanent"},
    enablePKCE: false);

class Posts extends StatefulWidget {
  final ValueChanged<APIPostData> onTapped;

  const Posts({
    @required this.onTapped,
  });
  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  static const url = 'https://oauth.reddit.com/best';
  final List<APIPost> posts = [];
  String after = "";

  @override
  Widget build(BuildContext context) {
    if (posts.isEmpty) {
      authGet(url).then((response) {
        if (response.statusCode == 200) {
          final parsed = APIPostListing.fromJson(jsonDecode(response.body));

          setState(() {
            after = parsed.data.after;
            posts.addAll(parsed.data.children);
          });
        }
      });
      return const Text("");
    }
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, i) {
        if (i >= posts.length - 1) {
          authGet("https://oauth.reddit.com/best?after=$after")
              .then((response) {
            if (response.statusCode == 200) {
              final parsed = APIPostListing.fromJson(jsonDecode(response.body));

              setState(() {
                after = parsed.data.after;
                posts.addAll(parsed.data.children);
              });
            }
          });
          return const Text("");
        }
        return Post(
          post: posts[i].data,
          onTapped: widget.onTapped,
        );
      },
      padding: const EdgeInsets.all(16.0),
    );
  }
}

Future<Response> authGet(String url) async {
  final token = await oauth2Helper.getTokenFromStorage();
  if (token == null) {
    return get(Uri.parse(url.replaceFirst("oauth", "api")));
  } else {
    return oauth2Helper.get(url);
  }
}
