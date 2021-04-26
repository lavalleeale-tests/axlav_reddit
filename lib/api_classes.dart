// ignore_for_file: non_constant_identifier_names
// ignore_for_file: prefer_constructors_over_static_methods
class APIPostListing {
  String kind;
  APIPostListingData data;
  static APIPostListing fromJson(dynamic data) {
    final postListing = APIPostListing();
    postListing.kind = data["kind"] as String;
    postListing.data = APIPostListingData.fromJson(data["data"]);
    return postListing;
  }
}

class APIPostListingData {
  String modhash;
  int dist;
  String before;
  String after;
  List<APIPost> children;
  static APIPostListingData fromJson(dynamic data) {
    final postListingData = APIPostListingData();
    postListingData.modhash = data["modhash"] as String;
    postListingData.dist = data["dist"] as int;
    postListingData.before = data["before"] as String;
    postListingData.after = data["after"] as String;
    postListingData.children = [];
    for (final post in data["children"]) {
      postListingData.children.add(APIPost.fromJson(post));
    }
    return postListingData;
  }
}

class APIPost {
  APIPostData data;
  String kind;
  static APIPost fromJson(dynamic data) {
    final post = APIPost();
    post.kind = data["kind"] as String;
    post.data = APIPostData.fromJson(data["data"]);
    return post;
  }
}

class APIPostData {
  dynamic approved_at_utc;
  String subreddit;
  String selftext;
  List user_reports;
  bool saved;
  dynamic mod_reason_title;
  int gilded;
  String title;
  String subreddit_name_prefixed;
  bool hidden;
  int pwls;
  String link_flair_css_class;
  int downs;
  dynamic top_awarded_type;
  String parent_whitelist_status;
  bool hide_score;
  String name;
  bool quarantine;
  String link_flair_text_color;
  double upvote_ratio;
  dynamic author_flair_background_color;
  String subreddit_type;
  int ups;
  int total_awards_received;
  dynamic media_embed;
  dynamic author_flair_template_id;
  bool is_original_content;
  String author_fullname;
  dynamic secure_media;
  bool is_reddit_media_domain;
  bool is_meta;
  dynamic category;
  dynamic secure_media_embed;
  String link_flair_text;
  bool can_mod_post;
  int score;
  dynamic approved_by;
  bool author_premium;
  String thumbnail;
  dynamic edited;
  dynamic author_flair_css_class;
  dynamic author_flair_richtext;
  dynamic gildings;
  dynamic content_categories;
  bool is_self;
  dynamic mod_note;
  double created;
  String link_flair_type;
  int wls;
  dynamic removed_by_category;
  dynamic banned_by;
  String author_flair_type;
  String domain;
  bool allow_live_comments;
  dynamic selftext_html;
  dynamic likes;
  String suggested_sort;
  dynamic banned_at_utc;
  String url_overridden_by_dest;
  dynamic view_count;
  bool archived;
  bool no_follow;
  bool is_crosspostable;
  bool pinned;
  bool over_18;
  List all_awardings;
  List awarders;
  bool media_only;
  String link_flair_template_id;
  bool can_gild;
  bool spoiler;
  bool locked;
  dynamic author_flair_text;
  List treatment_tags;
  bool visited;
  dynamic removed_by;
  dynamic num_reports;
  dynamic distinguished;
  String subreddit_id;
  dynamic mod_reason_by;
  dynamic removal_reason;
  String link_flair_background_color;
  String id;
  bool is_robot_indexable;
  int num_duplicates;
  dynamic report_reasons;
  String author;
  dynamic discussion_type;
  int num_comments;
  bool send_replies;
  dynamic media;
  bool contest_mode;
  bool author_patreon_flair;
  dynamic author_flair_text_color;
  String permalink;
  String whitelist_status;
  bool stickied;
  String url;
  int subreddit_subscribers;
  double created_utc;
  int num_crossposts;
  List mod_reports;
  bool is_video;
  String post_hint;
  static APIPostData fromJson(dynamic data) {
    final postData = APIPostData();
    postData.approved_at_utc = data["approved_at_utc"] as String;
    postData.subreddit = data["subreddit"] as String;
    postData.selftext = data["selftext"] as String;
    postData.user_reports = data["user_reports"] as List<dynamic>;
    postData.saved = data["saved"] as bool;
    postData.mod_reason_title = data["mod_reason_title"] as String;
    postData.gilded = data["gilded"] as int;
    postData.title = data["title"] as String;
    postData.subreddit_name_prefixed =
        data["subreddit_name_prefixed"] as String;
    postData.hidden = data["hidden"] as bool;
    postData.pwls = data["pwls"] as int;
    postData.link_flair_css_class = data["link_flair_css_class"] as String;
    postData.downs = data["downs"] as int;
    postData.top_awarded_type = data["top_awarded_type"] as String;
    postData.parent_whitelist_status =
        data["parent_whitelist_status"] as String;
    postData.hide_score = data["hide_score"] as bool;
    postData.name = data["name"] as String;
    postData.quarantine = data["quarantine"] as bool;
    postData.link_flair_text_color = data["link_flair_text_color"] as String;
    postData.upvote_ratio = data["upvote_ratio"] as double;
    postData.author_flair_background_color =
        data["author_flair_background_color"] as String;
    data["author_flair_background_color"] as String;
    postData.subreddit_type = data["subreddit_type"] as String;
    postData.ups = data["ups"] as int;
    postData.total_awards_received = data["total_awards_received"] as int;
    postData.media_embed = data["media_embed"] as dynamic;
    postData.author_flair_template_id =
        data["author_flair_template_id"] as String;
    postData.is_original_content = data["is_original_content"] as bool;
    postData.author_fullname = data["author_fullname"] as String;
    postData.secure_media = data["secure_media"] as dynamic;
    postData.is_reddit_media_domain = data["is_reddit_media_domain"] as bool;
    postData.is_meta = data["is_meta"] as bool;
    postData.category = data["category"] as String;
    postData.secure_media_embed = data["secure_media_embed"] as dynamic;
    postData.link_flair_text = data["link_flair_text"] as String;
    postData.can_mod_post = data["can_mod_post"] as bool;
    postData.score = data["score"] as int;
    postData.approved_by = data["approved_by"] as String;
    postData.author_premium = data["author_premium"] as bool;
    postData.thumbnail = data["thumbnail"] as String;
    postData.edited = data["edited"] as dynamic;
    postData.author_flair_css_class = data["author_flair_css_class"] as String;
    postData.author_flair_richtext =
        data["author_flair_richtext"] as List<dynamic>;
    postData.gildings = data["gildings"] as dynamic;
    postData.content_categories = data["content_categories"] as dynamic;
    postData.is_self = data["is_self"] as bool;
    postData.mod_note = data["mod_note"] as String;
    postData.created = data["created"] as double;
    postData.link_flair_type = data["link_flair_type"] as String;
    postData.wls = data["wls"] as int;
    postData.removed_by_category = data["removed_by_category"] as String;
    postData.banned_by = data["banned_by"] as String;
    postData.author_flair_type = data["author_flair_type"] as String;
    postData.domain = data["domain"] as String;
    postData.allow_live_comments = data["allow_live_comments"] as bool;
    postData.selftext_html = data["selftext_html"] as String;
    postData.likes = data["likes"] as String;
    postData.suggested_sort = data["suggested_sort"] as String;
    postData.banned_at_utc = data["banned_at_utc"] as String;
    postData.url_overridden_by_dest = data["url_overridden_by_dest"] as String;
    postData.view_count = data["view_count"] as String;
    postData.archived = data["archived"] as bool;
    postData.no_follow = data["no_follow"] as bool;
    postData.is_crosspostable = data["is_crosspostable"] as bool;
    postData.pinned = data["pinned"] as bool;
    postData.over_18 = data["over_18"] as bool;
    postData.all_awardings = data["all_awardings"] as List<dynamic>;
    postData.awarders = data["awarders"] as List<dynamic>;
    postData.media_only = data["media_only"] as bool;
    postData.link_flair_template_id = data["link_flair_template_id"] as String;
    postData.can_gild = data["can_gild"] as bool;
    postData.spoiler = data["spoiler"] as bool;
    postData.locked = data["locked"] as bool;
    postData.author_flair_text = data["author_flair_text"] as String;
    postData.treatment_tags = data["treatment_tags"] as List<dynamic>;
    postData.visited = data["visited"] as bool;
    postData.removed_by = data["removed_by"] as String;
    postData.num_reports = data["num_reports"] as String;
    postData.distinguished = data["distinguished"] as String;
    postData.subreddit_id = data["subreddit_id"] as String;
    postData.mod_reason_by = data["mod_reason_by"] as String;
    postData.removal_reason = data["removal_reason"] as String;
    postData.link_flair_background_color =
        data["link_flair_background_color"] as String;
    postData.id = data["id"] as String;
    postData.is_robot_indexable = data["is_robot_indexable"] as bool;
    postData.num_duplicates = data["num_duplicates"] as int;
    postData.report_reasons = data["report_reasons"] as String;
    postData.author = data["author"] as String;
    postData.discussion_type = data["discussion_type"] as String;
    postData.num_comments = data["num_comments"] as int;
    postData.send_replies = data["send_replies"] as bool;
    postData.media = data["media"] as dynamic;
    postData.contest_mode = data["contest_mode"] as bool;
    postData.author_patreon_flair = data["author_patreon_flair"] as bool;
    postData.author_flair_text_color =
        data["author_flair_text_color"] as String;
    postData.permalink = data["permalink"] as String;
    postData.whitelist_status = data["whitelist_status"] as String;
    postData.stickied = data["stickied"] as bool;
    postData.url = data["url"] as String;
    postData.subreddit_subscribers = data["subreddit_subscribers"] as int;
    postData.created_utc = data["created_utc"] as double;
    postData.num_crossposts = data["num_crossposts"] as int;
    postData.mod_reports = data["mod_reports"] as List<dynamic>;
    postData.is_video = data["is_video"] as bool;
    postData.post_hint = data["post_hint"] as String;
    return postData;
  }
}
