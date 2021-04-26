import 'package:axlav_reddit/api_classes.dart';
import 'package:axlav_reddit/authenticate.dart';
import 'package:axlav_reddit/post_details.dart';
import 'package:flutter/material.dart';
import 'posts.dart';

void main() {
  runApp(AxlavRedditApp());
}

class AxlavRedditApp extends StatefulWidget {
  @override
  _AxlavRedditAppState createState() => _AxlavRedditAppState();
}

class _AxlavRedditAppState extends State<AxlavRedditApp> {
  APIPostData _selectedPost;
  bool _showAuth = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Axlav's Reddit",
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Axlav's Reddit"),
            actions: [
              IconButton(
                  onPressed: () => {setState(() => _showAuth = !_showAuth)},
                  icon: const Icon(Icons.account_circle)),
              IconButton(onPressed: () => {}, icon: const Icon(Icons.settings))
            ],
          ),
          body: Navigator(
            pages: [
              MaterialPage(
                  child: Posts(onTapped: _handlePostTapped),
                  key: const ValueKey("PostsPage")),
              if (_selectedPost != null) PostDetailsPage(post: _selectedPost),
              if (_showAuth && _selectedPost == null)
                MaterialPage(child: Authenticate())
            ],
            onPopPage: (route, result) {
              if (!route.didPop(result)) {
                return false;
              }
              setState(() {
                _selectedPost = null;
                _showAuth = false;
              });
              return true;
            },
          ),
        ),
        theme: ThemeData.dark());
  }

  void _handlePostTapped(APIPostData post) {
    setState(() {
      _selectedPost = post;
    });
  }
}

class PostDetailsPage extends Page {
  final APIPostData post;

  PostDetailsPage({
    this.post,
  }) : super(key: ValueKey(post));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return PostDetails(post: post);
      },
    );
  }
}
