import 'package:axlav_reddit/api_classes.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:html_character_entities/html_character_entities.dart';

class Post extends StatelessWidget {
  final ValueChanged<APIPostData> onTapped;
  final APIPostData post;

  const Post({
    @required this.post,
    @required this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () => onTapped(post),
          child: Column(
            children: [
              ListTile(
                title: Text(post.title),
                subtitle: Text(
                  post.subreddit,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: post.post_hint == "image"
                    ? Image.network(post.url_overridden_by_dest)
                    : post.post_hint == "link"
                        ? InkWell(
                            onTap: () =>
                                _launchURL(post.url_overridden_by_dest),
                            child: post.thumbnail != "" &&
                                    post.thumbnail != "self" &&
                                    post.thumbnail != "nsfw" &&
                                    post.thumbnail != "spoiler" &&
                                    post.thumbnail != "default"
                                ? SizedBox(
                                    height: 50,
                                    child: Card(
                                        color: Colors.black,
                                        child: Padding(
                                          padding: const EdgeInsets.all(4),
                                          child: Row(
                                            children: [
                                              Image.network(post.thumbnail),
                                              Text(
                                                  post.url_overridden_by_dest
                                                              .length >
                                                          30
                                                      ? "${post.url_overridden_by_dest.substring(0, 30)}..."
                                                      : post
                                                          .url_overridden_by_dest,
                                                  style: const TextStyle(
                                                      color: Colors.grey))
                                            ],
                                          ),
                                        )))
                                : Text(
                                    post.url_overridden_by_dest,
                                    style: const TextStyle(color: Colors.blue),
                                  ))
                        : post.selftext != ""
                            ? Text(HtmlCharacterEntities.decode(
                                post.selftext.length > 100
                                    ? "${post.selftext.substring(0, 100)}..."
                                    : post.selftext))
                            : post.thumbnail != "" &&
                                    post.thumbnail != "self" &&
                                    post.thumbnail != "nsfw" &&
                                    post.thumbnail != "spoiler" &&
                                    post.thumbnail != "default"
                                ? Image.network(post.thumbnail)
                                : const Text("Unknown Post"),
              )
            ],
          ),
        ));
  }
}

Future<void> _launchURL(String _url) async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
