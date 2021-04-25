import 'package:axlav_reddit/APIClasses.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:html_character_entities/html_character_entities.dart';

class PostDetails extends StatefulWidget {
  final APIPostData post;

  PostDetails({
    @required this.post,
  });
  @override
  _PostDetailsState createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  @override
  Widget build(BuildContext context) {
    print(widget.post.name);
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
                        child: widget.post.thumbnail != "" &&
                                widget.post.thumbnail != "self" &&
                                widget.post.thumbnail != "nsfw" &&
                                widget.post.thumbnail != "spoiler" &&
                                widget.post.thumbnail != "default"
                            ? Image.network(widget.post.thumbnail)
                            : Text(
                                widget.post.url_overridden_by_dest,
                                style: TextStyle(color: Colors.blue),
                              ),
                        onTap: () =>
                            _launchURL(widget.post.url_overridden_by_dest))
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
                            : Text("Unknow Post"),
          )
        ],
      )),
    );
  }
}

void _launchURL(_url) async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
