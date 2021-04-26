import 'package:axlav_reddit/api_classes.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:html_character_entities/html_character_entities.dart';

class PostDetails extends StatefulWidget {
  final APIPostData post;

  const PostDetails({
    @required this.post,
  });
  @override
  _PostDetailsState createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: SingleChildScrollView(
          child: Column(
        children: [
          ListTile(
            title: Text(widget.post.title),
            subtitle: Text(
              widget.post.subreddit,
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: widget.post.post_hint == "image"
                ? Image.network(widget.post.url_overridden_by_dest)
                : widget.post.post_hint == "link"
                    ? InkWell(
                        onTap: () =>
                            _launchURL(widget.post.url_overridden_by_dest),
                        child: widget.post.thumbnail != "" &&
                                widget.post.thumbnail != "self" &&
                                widget.post.thumbnail != "nsfw" &&
                                widget.post.thumbnail != "spoiler" &&
                                widget.post.thumbnail != "default"
                            ? Image.network(widget.post.thumbnail)
                            : Text(
                                widget.post.url_overridden_by_dest,
                                style: const TextStyle(color: Colors.blue),
                              ),
                      )
                    : widget.post.selftext != ""
                        ? MarkdownBody(
                            data: HtmlCharacterEntities.decode(
                              widget.post.selftext,
                            ),
                          )
                        : widget.post.thumbnail != "" &&
                                widget.post.thumbnail != "self" &&
                                widget.post.thumbnail != "nsfw" &&
                                widget.post.thumbnail != "spoiler" &&
                                widget.post.thumbnail != "default"
                            ? Image.network(widget.post.thumbnail)
                            : const Text("Unknown Post"),
          )
        ],
      )),
    );
  }
}

Future<void> _launchURL(String _url) async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
