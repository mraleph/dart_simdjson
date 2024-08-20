// ignore_for_file: non_constant_identifier_names

import 'package:dart_simdjson/decoder.dart';

part 'tweet.g.dart';

@FromJsonBytes()
extension type Feed(Json<({List<Tweet> statuses})> _) {}

@FromJsonBytes()
extension type Tweet(
    Json<
            ({
              String created_at,
              int id,
              String text,
              String source,
              bool truncated,
              int? in_reply_to_status_id,
              int? in_reply_to_user_id,
              String? in_reply_to_screen_name,
              User user,
              int? quoted_status_id,
              int? quote_count,
              int? reply_count,
              int retweet_count,
              int? favorite_count,
              bool? favorited,
              bool retweeted,
              bool? possibly_sensitive
            })>
        _) {}

@FromJsonBytes()
extension type User(
    Json<
            ({
              int id,
              String name,
              String screen_name,
              String? location,
              String? url,
              String? description,
              bool protected,
              bool verified,
              int followers_count,
              int friends_count,
              int listed_count,
              String created_at,
              String profile_link_color,
              bool default_profile_image,
              String profile_background_color,
              bool is_translator,
              int statuses_count,
              bool profile_background_tile,
              bool default_profile,
              String profile_background_image_url_https,
              int favourites_count,
              String profile_sidebar_fill_color,
              bool geo_enabled,
              String profile_sidebar_border_color,
              bool show_all_inline_media,
              String lang,
              String profile_image_url_https,
              bool profile_use_background_image,
              String profile_text_color,
              bool contributors_enabled,
              String profile_background_image_url,
              String profile_image_url,
            })>
        _) {}
