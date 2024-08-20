// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lines_longer_than_80_chars, text_direction_code_point_in_literal, inference_failure_on_function_invocation, inference_failure_on_collection_literal, unnecessary_this, non_constant_identifier_names, constant_identifier_names

part of 'tweet.dart';

// **************************************************************************
// FromJsonBytesGenerator
// **************************************************************************

/// Helper methods for accessing data deserilized from JSON and stored
/// on the native side.
extension FeedSimdJson on Feed {
  /// Auxiliary function to enable tree-shaking of unused parts of the
  /// descriptor. See README.md for details.
  @pragma('weak-tearoff-reference')
  static T Function()? _weakRef<T>(T Function()? x) => x;

  static bool _descriptorWasLinked = false;
  static final _descriptor = LayoutDescriptor<Feed>.unlinked([
    if (_weakRef(_offsetOf$statuses) != null)
      (
        name: 'statuses',
        type: FieldType.kCompound,
        offset: 0,
        presenceBit: null,
        nestedIndex: 0
      ),
  ]);
  static final _listDescriptor = LayoutDescriptor<List<Feed>>.list(
      FieldType.kCompound,
      elementLayout: _descriptor);
  static final _listOfOptionalDescriptor = LayoutDescriptor<List<Feed?>>.list(
      FieldType.kCompound,
      elementLayout: _descriptor,
      isNullable: true);

  /// [LayoutDescriptor] corresponding to `Feed` type.
  ///
  /// It can be used to deserialize JSON bytes into a native object representing
  /// `Feed` data.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<Feed> get $ {
    if (_descriptorWasLinked) {
      return _descriptor;
    }
    _descriptorWasLinked = true;
    return _descriptor..link([TweetSimdJson.$list]);
  }

  /// [LayoutDescriptor] corresponding to `List<Feed>` type.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<List<Feed>> get $list {
    $; // Make sure to link norma descriptor.
    return _listDescriptor;
  }

  /// [LayoutDescriptor] corresponding to `List<Feed?>` type.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<List<Feed?>> get $listOfOptional {
    $; // Make sure to link norma descriptor.
    return _listOfOptionalDescriptor;
  }

  /// Offset to the field `statuses` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$statuses() => 0;

  /// Accessor for `statuses` field.
  @pragma('vm:prefer-inline')
  List<Tweet> get statuses =>
      this._.loadList(_offsetOf$statuses()).toListOfObject();

  /// Converts deserialized object into a [Map].
  ///
  /// Note: calling this would disable tree-shaking of fields.
  Map<String, dynamic> toMap({bool includeType = false}) => {
        if (includeType) r'$type': 'Feed',
        'statuses': this
            .statuses
            .map((v) => v.toMap(includeType: includeType))
            .toList(),
      };
}

extension FeedDecoder on Decoder<Feed> {
  /// Decode an [Feed] object from JSON bytes.
  Feed convert(Uint8List bytes) => FeedSimdJson.$.decodeBytes(bytes);
}

extension FeedListDecoder on Decoder<List<Feed>> {
  /// Decode a list of [Feed] objects from JSON bytes.
  List<Feed> convert(Uint8List bytes) => FeedSimdJson.$list.decodeBytes(bytes);
}

/// Helper methods for accessing data deserilized from JSON and stored
/// on the native side.
extension TweetSimdJson on Tweet {
  /// Auxiliary function to enable tree-shaking of unused parts of the
  /// descriptor. See README.md for details.
  @pragma('weak-tearoff-reference')
  static T Function()? _weakRef<T>(T Function()? x) => x;

  static bool _descriptorWasLinked = false;
  static final _descriptor = LayoutDescriptor<Tweet>.unlinked([
    if (_weakRef(_offsetOf$created_at) != null)
      (
        name: 'created_at',
        type: FieldType.kString,
        offset: 16,
        presenceBit: null,
        nestedIndex: null
      ),
    if (_weakRef(_offsetOf$favorite_count) != null)
      (
        name: 'favorite_count',
        type: FieldType.kInt64,
        offset: 24,
        presenceBit: 2,
        nestedIndex: null
      ),
    if (_weakRef(_offsetOf$favorited) != null)
      (
        name: 'favorited',
        type: FieldType.kBool,
        offset: 8,
        presenceBit: 0,
        nestedIndex: null
      ),
    if (_weakRef(_offsetOf$id) != null)
      (
        name: 'id',
        type: FieldType.kInt64,
        offset: 32,
        presenceBit: null,
        nestedIndex: null
      ),
    if (_weakRef(_offsetOf$in_reply_to_screen_name) != null)
      (
        name: 'in_reply_to_screen_name',
        type: FieldType.kString,
        offset: 40,
        presenceBit: 3,
        nestedIndex: null
      ),
    if (_weakRef(_offsetOf$in_reply_to_status_id) != null)
      (
        name: 'in_reply_to_status_id',
        type: FieldType.kInt64,
        offset: 48,
        presenceBit: 4,
        nestedIndex: null
      ),
    if (_weakRef(_offsetOf$in_reply_to_user_id) != null)
      (
        name: 'in_reply_to_user_id',
        type: FieldType.kInt64,
        offset: 56,
        presenceBit: 5,
        nestedIndex: null
      ),
    if (_weakRef(_offsetOf$possibly_sensitive) != null)
      (
        name: 'possibly_sensitive',
        type: FieldType.kBool,
        offset: 9,
        presenceBit: 1,
        nestedIndex: null
      ),
    if (_weakRef(_offsetOf$quote_count) != null)
      (
        name: 'quote_count',
        type: FieldType.kInt64,
        offset: 64,
        presenceBit: 6,
        nestedIndex: null
      ),
    if (_weakRef(_offsetOf$quoted_status_id) != null)
      (
        name: 'quoted_status_id',
        type: FieldType.kInt64,
        offset: 72,
        presenceBit: 7,
        nestedIndex: null
      ),
    if (_weakRef(_offsetOf$reply_count) != null)
      (
        name: 'reply_count',
        type: FieldType.kInt64,
        offset: 80,
        presenceBit: 8,
        nestedIndex: null
      ),
    if (_weakRef(_offsetOf$retweet_count) != null)
      (
        name: 'retweet_count',
        type: FieldType.kInt64,
        offset: 88,
        presenceBit: null,
        nestedIndex: null
      ),
    if (_weakRef(_offsetOf$retweeted) != null)
      (
        name: 'retweeted',
        type: FieldType.kBool,
        offset: 10,
        presenceBit: null,
        nestedIndex: null
      ),
    if (_weakRef(_offsetOf$source) != null)
      (
        name: 'source',
        type: FieldType.kString,
        offset: 96,
        presenceBit: null,
        nestedIndex: null
      ),
    if (_weakRef(_offsetOf$text) != null)
      (
        name: 'text',
        type: FieldType.kString,
        offset: 104,
        presenceBit: null,
        nestedIndex: null
      ),
    if (_weakRef(_offsetOf$truncated) != null)
      (
        name: 'truncated',
        type: FieldType.kBool,
        offset: 11,
        presenceBit: null,
        nestedIndex: null
      ),
    if (_weakRef(_offsetOf$user) != null)
      (
        name: 'user',
        type: FieldType.kCompound,
        offset: 112,
        presenceBit: null,
        nestedIndex: 0
      ),
  ]);
  static final _listDescriptor = LayoutDescriptor<List<Tweet>>.list(
      FieldType.kCompound,
      elementLayout: _descriptor);
  static final _listOfOptionalDescriptor = LayoutDescriptor<List<Tweet?>>.list(
      FieldType.kCompound,
      elementLayout: _descriptor,
      isNullable: true);

  /// [LayoutDescriptor] corresponding to `Tweet` type.
  ///
  /// It can be used to deserialize JSON bytes into a native object representing
  /// `Tweet` data.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<Tweet> get $ {
    if (_descriptorWasLinked) {
      return _descriptor;
    }
    _descriptorWasLinked = true;
    return _descriptor..link([UserSimdJson.$]);
  }

  /// [LayoutDescriptor] corresponding to `List<Tweet>` type.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<List<Tweet>> get $list {
    $; // Make sure to link norma descriptor.
    return _listDescriptor;
  }

  /// [LayoutDescriptor] corresponding to `List<Tweet?>` type.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<List<Tweet?>> get $listOfOptional {
    $; // Make sure to link norma descriptor.
    return _listOfOptionalDescriptor;
  }

  /// Offset to the field `created_at` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$created_at() => 16;

  /// Accessor for `created_at` field.
  @pragma('vm:prefer-inline')
  String get created_at => this._.loadString(_offsetOf$created_at());

  /// Index of the presence bit denoting whether `favorite_count` was present.
  static const int _presenceBit$favorite_count = 2;

  /// Offset to the field `favorite_count` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$favorite_count() => 24;

  /// Accessor for `favorite_count` field.
  @pragma('vm:prefer-inline')
  int? get favorite_count => this
      ._
      .loadIntOrNull(_offsetOf$favorite_count(), _presenceBit$favorite_count);

  /// Index of the presence bit denoting whether `favorited` was present.
  static const int _presenceBit$favorited = 0;

  /// Offset to the field `favorited` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$favorited() => 8;

  /// Accessor for `favorited` field.
  @pragma('vm:prefer-inline')
  bool? get favorited =>
      this._.loadBoolOrNull(_offsetOf$favorited(), _presenceBit$favorited);

  /// Offset to the field `id` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$id() => 32;

  /// Accessor for `id` field.
  @pragma('vm:prefer-inline')
  int get id => this._.loadInt(_offsetOf$id());

  /// Index of the presence bit denoting whether `in_reply_to_screen_name` was present.
  static const int _presenceBit$in_reply_to_screen_name = 3;

  /// Offset to the field `in_reply_to_screen_name` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$in_reply_to_screen_name() => 40;

  /// Accessor for `in_reply_to_screen_name` field.
  @pragma('vm:prefer-inline')
  String? get in_reply_to_screen_name => this._.loadStringOrNull(
      _offsetOf$in_reply_to_screen_name(),
      _presenceBit$in_reply_to_screen_name);

  /// Index of the presence bit denoting whether `in_reply_to_status_id` was present.
  static const int _presenceBit$in_reply_to_status_id = 4;

  /// Offset to the field `in_reply_to_status_id` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$in_reply_to_status_id() => 48;

  /// Accessor for `in_reply_to_status_id` field.
  @pragma('vm:prefer-inline')
  int? get in_reply_to_status_id => this._.loadIntOrNull(
      _offsetOf$in_reply_to_status_id(), _presenceBit$in_reply_to_status_id);

  /// Index of the presence bit denoting whether `in_reply_to_user_id` was present.
  static const int _presenceBit$in_reply_to_user_id = 5;

  /// Offset to the field `in_reply_to_user_id` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$in_reply_to_user_id() => 56;

  /// Accessor for `in_reply_to_user_id` field.
  @pragma('vm:prefer-inline')
  int? get in_reply_to_user_id => this._.loadIntOrNull(
      _offsetOf$in_reply_to_user_id(), _presenceBit$in_reply_to_user_id);

  /// Index of the presence bit denoting whether `possibly_sensitive` was present.
  static const int _presenceBit$possibly_sensitive = 1;

  /// Offset to the field `possibly_sensitive` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$possibly_sensitive() => 9;

  /// Accessor for `possibly_sensitive` field.
  @pragma('vm:prefer-inline')
  bool? get possibly_sensitive => this._.loadBoolOrNull(
      _offsetOf$possibly_sensitive(), _presenceBit$possibly_sensitive);

  /// Index of the presence bit denoting whether `quote_count` was present.
  static const int _presenceBit$quote_count = 6;

  /// Offset to the field `quote_count` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$quote_count() => 64;

  /// Accessor for `quote_count` field.
  @pragma('vm:prefer-inline')
  int? get quote_count =>
      this._.loadIntOrNull(_offsetOf$quote_count(), _presenceBit$quote_count);

  /// Index of the presence bit denoting whether `quoted_status_id` was present.
  static const int _presenceBit$quoted_status_id = 7;

  /// Offset to the field `quoted_status_id` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$quoted_status_id() => 72;

  /// Accessor for `quoted_status_id` field.
  @pragma('vm:prefer-inline')
  int? get quoted_status_id => this._.loadIntOrNull(
      _offsetOf$quoted_status_id(), _presenceBit$quoted_status_id);

  /// Index of the presence bit denoting whether `reply_count` was present.
  static const int _presenceBit$reply_count = 8;

  /// Offset to the field `reply_count` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$reply_count() => 80;

  /// Accessor for `reply_count` field.
  @pragma('vm:prefer-inline')
  int? get reply_count =>
      this._.loadIntOrNull(_offsetOf$reply_count(), _presenceBit$reply_count);

  /// Offset to the field `retweet_count` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$retweet_count() => 88;

  /// Accessor for `retweet_count` field.
  @pragma('vm:prefer-inline')
  int get retweet_count => this._.loadInt(_offsetOf$retweet_count());

  /// Offset to the field `retweeted` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$retweeted() => 10;

  /// Accessor for `retweeted` field.
  @pragma('vm:prefer-inline')
  bool get retweeted => this._.loadBool(_offsetOf$retweeted());

  /// Offset to the field `source` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$source() => 96;

  /// Accessor for `source` field.
  @pragma('vm:prefer-inline')
  String get source => this._.loadString(_offsetOf$source());

  /// Offset to the field `text` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$text() => 104;

  /// Accessor for `text` field.
  @pragma('vm:prefer-inline')
  String get text => this._.loadString(_offsetOf$text());

  /// Offset to the field `truncated` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$truncated() => 11;

  /// Accessor for `truncated` field.
  @pragma('vm:prefer-inline')
  bool get truncated => this._.loadBool(_offsetOf$truncated());

  /// Offset to the field `user` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$user() => 112;

  /// Accessor for `user` field.
  @pragma('vm:prefer-inline')
  User get user => this._.loadObject(_offsetOf$user());

  /// Converts deserialized object into a [Map].
  ///
  /// Note: calling this would disable tree-shaking of fields.
  Map<String, dynamic> toMap({bool includeType = false}) => {
        if (includeType) r'$type': 'Tweet',
        'created_at': this.created_at,
        'favorite_count': this.favorite_count,
        'favorited': this.favorited,
        'id': this.id,
        'in_reply_to_screen_name': this.in_reply_to_screen_name,
        'in_reply_to_status_id': this.in_reply_to_status_id,
        'in_reply_to_user_id': this.in_reply_to_user_id,
        'possibly_sensitive': this.possibly_sensitive,
        'quote_count': this.quote_count,
        'quoted_status_id': this.quoted_status_id,
        'reply_count': this.reply_count,
        'retweet_count': this.retweet_count,
        'retweeted': this.retweeted,
        'source': this.source,
        'text': this.text,
        'truncated': this.truncated,
        'user': this.user.toMap(includeType: includeType),
      };
}

extension TweetDecoder on Decoder<Tweet> {
  /// Decode an [Tweet] object from JSON bytes.
  Tweet convert(Uint8List bytes) => TweetSimdJson.$.decodeBytes(bytes);
}

extension TweetListDecoder on Decoder<List<Tweet>> {
  /// Decode a list of [Tweet] objects from JSON bytes.
  List<Tweet> convert(Uint8List bytes) =>
      TweetSimdJson.$list.decodeBytes(bytes);
}

/// Helper methods for accessing data deserilized from JSON and stored
/// on the native side.
extension UserSimdJson on User {
  /// Auxiliary function to enable tree-shaking of unused parts of the
  /// descriptor. See README.md for details.
  @pragma('weak-tearoff-reference')
  static T Function()? _weakRef<T>(T Function()? x) => x;

  static bool _descriptorWasLinked = false;
  static final _descriptor = LayoutDescriptor<User>.unlinked([
    if (_weakRef(_offsetOf$contributors_enabled) != null)
      (
        name: 'contributors_enabled',
        type: FieldType.kBool,
        offset: 8,
        presenceBit: null,
        nestedIndex: null
      ),
    if (_weakRef(_offsetOf$created_at) != null)
      (
        name: 'created_at',
        type: FieldType.kString,
        offset: 24,
        presenceBit: null,
        nestedIndex: null
      ),
    if (_weakRef(_offsetOf$default_profile) != null)
      (
        name: 'default_profile',
        type: FieldType.kBool,
        offset: 9,
        presenceBit: null,
        nestedIndex: null
      ),
    if (_weakRef(_offsetOf$default_profile_image) != null)
      (
        name: 'default_profile_image',
        type: FieldType.kBool,
        offset: 10,
        presenceBit: null,
        nestedIndex: null
      ),
    if (_weakRef(_offsetOf$description) != null)
      (
        name: 'description',
        type: FieldType.kString,
        offset: 32,
        presenceBit: 0,
        nestedIndex: null
      ),
    if (_weakRef(_offsetOf$favourites_count) != null)
      (
        name: 'favourites_count',
        type: FieldType.kInt64,
        offset: 40,
        presenceBit: null,
        nestedIndex: null
      ),
    if (_weakRef(_offsetOf$followers_count) != null)
      (
        name: 'followers_count',
        type: FieldType.kInt64,
        offset: 48,
        presenceBit: null,
        nestedIndex: null
      ),
    if (_weakRef(_offsetOf$friends_count) != null)
      (
        name: 'friends_count',
        type: FieldType.kInt64,
        offset: 56,
        presenceBit: null,
        nestedIndex: null
      ),
    if (_weakRef(_offsetOf$geo_enabled) != null)
      (
        name: 'geo_enabled',
        type: FieldType.kBool,
        offset: 11,
        presenceBit: null,
        nestedIndex: null
      ),
    if (_weakRef(_offsetOf$id) != null)
      (
        name: 'id',
        type: FieldType.kInt64,
        offset: 64,
        presenceBit: null,
        nestedIndex: null
      ),
    if (_weakRef(_offsetOf$is_translator) != null)
      (
        name: 'is_translator',
        type: FieldType.kBool,
        offset: 12,
        presenceBit: null,
        nestedIndex: null
      ),
    if (_weakRef(_offsetOf$lang) != null)
      (
        name: 'lang',
        type: FieldType.kString,
        offset: 72,
        presenceBit: null,
        nestedIndex: null
      ),
    if (_weakRef(_offsetOf$listed_count) != null)
      (
        name: 'listed_count',
        type: FieldType.kInt64,
        offset: 80,
        presenceBit: null,
        nestedIndex: null
      ),
    if (_weakRef(_offsetOf$location) != null)
      (
        name: 'location',
        type: FieldType.kString,
        offset: 88,
        presenceBit: 1,
        nestedIndex: null
      ),
    if (_weakRef(_offsetOf$name) != null)
      (
        name: 'name',
        type: FieldType.kString,
        offset: 96,
        presenceBit: null,
        nestedIndex: null
      ),
    if (_weakRef(_offsetOf$profile_background_color) != null)
      (
        name: 'profile_background_color',
        type: FieldType.kString,
        offset: 104,
        presenceBit: null,
        nestedIndex: null
      ),
    if (_weakRef(_offsetOf$profile_background_image_url) != null)
      (
        name: 'profile_background_image_url',
        type: FieldType.kString,
        offset: 112,
        presenceBit: null,
        nestedIndex: null
      ),
    if (_weakRef(_offsetOf$profile_background_image_url_https) != null)
      (
        name: 'profile_background_image_url_https',
        type: FieldType.kString,
        offset: 120,
        presenceBit: null,
        nestedIndex: null
      ),
    if (_weakRef(_offsetOf$profile_background_tile) != null)
      (
        name: 'profile_background_tile',
        type: FieldType.kBool,
        offset: 13,
        presenceBit: null,
        nestedIndex: null
      ),
    if (_weakRef(_offsetOf$profile_image_url) != null)
      (
        name: 'profile_image_url',
        type: FieldType.kString,
        offset: 128,
        presenceBit: null,
        nestedIndex: null
      ),
    if (_weakRef(_offsetOf$profile_image_url_https) != null)
      (
        name: 'profile_image_url_https',
        type: FieldType.kString,
        offset: 136,
        presenceBit: null,
        nestedIndex: null
      ),
    if (_weakRef(_offsetOf$profile_link_color) != null)
      (
        name: 'profile_link_color',
        type: FieldType.kString,
        offset: 144,
        presenceBit: null,
        nestedIndex: null
      ),
    if (_weakRef(_offsetOf$profile_sidebar_border_color) != null)
      (
        name: 'profile_sidebar_border_color',
        type: FieldType.kString,
        offset: 152,
        presenceBit: null,
        nestedIndex: null
      ),
    if (_weakRef(_offsetOf$profile_sidebar_fill_color) != null)
      (
        name: 'profile_sidebar_fill_color',
        type: FieldType.kString,
        offset: 160,
        presenceBit: null,
        nestedIndex: null
      ),
    if (_weakRef(_offsetOf$profile_text_color) != null)
      (
        name: 'profile_text_color',
        type: FieldType.kString,
        offset: 168,
        presenceBit: null,
        nestedIndex: null
      ),
    if (_weakRef(_offsetOf$profile_use_background_image) != null)
      (
        name: 'profile_use_background_image',
        type: FieldType.kBool,
        offset: 14,
        presenceBit: null,
        nestedIndex: null
      ),
    if (_weakRef(_offsetOf$protected) != null)
      (
        name: 'protected',
        type: FieldType.kBool,
        offset: 15,
        presenceBit: null,
        nestedIndex: null
      ),
    if (_weakRef(_offsetOf$screen_name) != null)
      (
        name: 'screen_name',
        type: FieldType.kString,
        offset: 176,
        presenceBit: null,
        nestedIndex: null
      ),
    if (_weakRef(_offsetOf$show_all_inline_media) != null)
      (
        name: 'show_all_inline_media',
        type: FieldType.kBool,
        offset: 16,
        presenceBit: null,
        nestedIndex: null
      ),
    if (_weakRef(_offsetOf$statuses_count) != null)
      (
        name: 'statuses_count',
        type: FieldType.kInt64,
        offset: 184,
        presenceBit: null,
        nestedIndex: null
      ),
    if (_weakRef(_offsetOf$url) != null)
      (
        name: 'url',
        type: FieldType.kString,
        offset: 192,
        presenceBit: 2,
        nestedIndex: null
      ),
    if (_weakRef(_offsetOf$verified) != null)
      (
        name: 'verified',
        type: FieldType.kBool,
        offset: 17,
        presenceBit: null,
        nestedIndex: null
      ),
  ]);
  static final _listDescriptor = LayoutDescriptor<List<User>>.list(
      FieldType.kCompound,
      elementLayout: _descriptor);
  static final _listOfOptionalDescriptor = LayoutDescriptor<List<User?>>.list(
      FieldType.kCompound,
      elementLayout: _descriptor,
      isNullable: true);

  /// [LayoutDescriptor] corresponding to `User` type.
  ///
  /// It can be used to deserialize JSON bytes into a native object representing
  /// `User` data.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<User> get $ {
    if (_descriptorWasLinked) {
      return _descriptor;
    }
    _descriptorWasLinked = true;
    return _descriptor..link([]);
  }

  /// [LayoutDescriptor] corresponding to `List<User>` type.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<List<User>> get $list {
    $; // Make sure to link norma descriptor.
    return _listDescriptor;
  }

  /// [LayoutDescriptor] corresponding to `List<User?>` type.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<List<User?>> get $listOfOptional {
    $; // Make sure to link norma descriptor.
    return _listOfOptionalDescriptor;
  }

  /// Offset to the field `contributors_enabled` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$contributors_enabled() => 8;

  /// Accessor for `contributors_enabled` field.
  @pragma('vm:prefer-inline')
  bool get contributors_enabled =>
      this._.loadBool(_offsetOf$contributors_enabled());

  /// Offset to the field `created_at` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$created_at() => 24;

  /// Accessor for `created_at` field.
  @pragma('vm:prefer-inline')
  String get created_at => this._.loadString(_offsetOf$created_at());

  /// Offset to the field `default_profile` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$default_profile() => 9;

  /// Accessor for `default_profile` field.
  @pragma('vm:prefer-inline')
  bool get default_profile => this._.loadBool(_offsetOf$default_profile());

  /// Offset to the field `default_profile_image` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$default_profile_image() => 10;

  /// Accessor for `default_profile_image` field.
  @pragma('vm:prefer-inline')
  bool get default_profile_image =>
      this._.loadBool(_offsetOf$default_profile_image());

  /// Index of the presence bit denoting whether `description` was present.
  static const int _presenceBit$description = 0;

  /// Offset to the field `description` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$description() => 32;

  /// Accessor for `description` field.
  @pragma('vm:prefer-inline')
  String? get description => this
      ._
      .loadStringOrNull(_offsetOf$description(), _presenceBit$description);

  /// Offset to the field `favourites_count` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$favourites_count() => 40;

  /// Accessor for `favourites_count` field.
  @pragma('vm:prefer-inline')
  int get favourites_count => this._.loadInt(_offsetOf$favourites_count());

  /// Offset to the field `followers_count` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$followers_count() => 48;

  /// Accessor for `followers_count` field.
  @pragma('vm:prefer-inline')
  int get followers_count => this._.loadInt(_offsetOf$followers_count());

  /// Offset to the field `friends_count` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$friends_count() => 56;

  /// Accessor for `friends_count` field.
  @pragma('vm:prefer-inline')
  int get friends_count => this._.loadInt(_offsetOf$friends_count());

  /// Offset to the field `geo_enabled` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$geo_enabled() => 11;

  /// Accessor for `geo_enabled` field.
  @pragma('vm:prefer-inline')
  bool get geo_enabled => this._.loadBool(_offsetOf$geo_enabled());

  /// Offset to the field `id` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$id() => 64;

  /// Accessor for `id` field.
  @pragma('vm:prefer-inline')
  int get id => this._.loadInt(_offsetOf$id());

  /// Offset to the field `is_translator` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$is_translator() => 12;

  /// Accessor for `is_translator` field.
  @pragma('vm:prefer-inline')
  bool get is_translator => this._.loadBool(_offsetOf$is_translator());

  /// Offset to the field `lang` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$lang() => 72;

  /// Accessor for `lang` field.
  @pragma('vm:prefer-inline')
  String get lang => this._.loadString(_offsetOf$lang());

  /// Offset to the field `listed_count` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$listed_count() => 80;

  /// Accessor for `listed_count` field.
  @pragma('vm:prefer-inline')
  int get listed_count => this._.loadInt(_offsetOf$listed_count());

  /// Index of the presence bit denoting whether `location` was present.
  static const int _presenceBit$location = 1;

  /// Offset to the field `location` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$location() => 88;

  /// Accessor for `location` field.
  @pragma('vm:prefer-inline')
  String? get location =>
      this._.loadStringOrNull(_offsetOf$location(), _presenceBit$location);

  /// Offset to the field `name` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$name() => 96;

  /// Accessor for `name` field.
  @pragma('vm:prefer-inline')
  String get name => this._.loadString(_offsetOf$name());

  /// Offset to the field `profile_background_color` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$profile_background_color() => 104;

  /// Accessor for `profile_background_color` field.
  @pragma('vm:prefer-inline')
  String get profile_background_color =>
      this._.loadString(_offsetOf$profile_background_color());

  /// Offset to the field `profile_background_image_url` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$profile_background_image_url() => 112;

  /// Accessor for `profile_background_image_url` field.
  @pragma('vm:prefer-inline')
  String get profile_background_image_url =>
      this._.loadString(_offsetOf$profile_background_image_url());

  /// Offset to the field `profile_background_image_url_https` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$profile_background_image_url_https() => 120;

  /// Accessor for `profile_background_image_url_https` field.
  @pragma('vm:prefer-inline')
  String get profile_background_image_url_https =>
      this._.loadString(_offsetOf$profile_background_image_url_https());

  /// Offset to the field `profile_background_tile` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$profile_background_tile() => 13;

  /// Accessor for `profile_background_tile` field.
  @pragma('vm:prefer-inline')
  bool get profile_background_tile =>
      this._.loadBool(_offsetOf$profile_background_tile());

  /// Offset to the field `profile_image_url` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$profile_image_url() => 128;

  /// Accessor for `profile_image_url` field.
  @pragma('vm:prefer-inline')
  String get profile_image_url =>
      this._.loadString(_offsetOf$profile_image_url());

  /// Offset to the field `profile_image_url_https` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$profile_image_url_https() => 136;

  /// Accessor for `profile_image_url_https` field.
  @pragma('vm:prefer-inline')
  String get profile_image_url_https =>
      this._.loadString(_offsetOf$profile_image_url_https());

  /// Offset to the field `profile_link_color` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$profile_link_color() => 144;

  /// Accessor for `profile_link_color` field.
  @pragma('vm:prefer-inline')
  String get profile_link_color =>
      this._.loadString(_offsetOf$profile_link_color());

  /// Offset to the field `profile_sidebar_border_color` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$profile_sidebar_border_color() => 152;

  /// Accessor for `profile_sidebar_border_color` field.
  @pragma('vm:prefer-inline')
  String get profile_sidebar_border_color =>
      this._.loadString(_offsetOf$profile_sidebar_border_color());

  /// Offset to the field `profile_sidebar_fill_color` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$profile_sidebar_fill_color() => 160;

  /// Accessor for `profile_sidebar_fill_color` field.
  @pragma('vm:prefer-inline')
  String get profile_sidebar_fill_color =>
      this._.loadString(_offsetOf$profile_sidebar_fill_color());

  /// Offset to the field `profile_text_color` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$profile_text_color() => 168;

  /// Accessor for `profile_text_color` field.
  @pragma('vm:prefer-inline')
  String get profile_text_color =>
      this._.loadString(_offsetOf$profile_text_color());

  /// Offset to the field `profile_use_background_image` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$profile_use_background_image() => 14;

  /// Accessor for `profile_use_background_image` field.
  @pragma('vm:prefer-inline')
  bool get profile_use_background_image =>
      this._.loadBool(_offsetOf$profile_use_background_image());

  /// Offset to the field `protected` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$protected() => 15;

  /// Accessor for `protected` field.
  @pragma('vm:prefer-inline')
  bool get protected => this._.loadBool(_offsetOf$protected());

  /// Offset to the field `screen_name` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$screen_name() => 176;

  /// Accessor for `screen_name` field.
  @pragma('vm:prefer-inline')
  String get screen_name => this._.loadString(_offsetOf$screen_name());

  /// Offset to the field `show_all_inline_media` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$show_all_inline_media() => 16;

  /// Accessor for `show_all_inline_media` field.
  @pragma('vm:prefer-inline')
  bool get show_all_inline_media =>
      this._.loadBool(_offsetOf$show_all_inline_media());

  /// Offset to the field `statuses_count` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$statuses_count() => 184;

  /// Accessor for `statuses_count` field.
  @pragma('vm:prefer-inline')
  int get statuses_count => this._.loadInt(_offsetOf$statuses_count());

  /// Index of the presence bit denoting whether `url` was present.
  static const int _presenceBit$url = 2;

  /// Offset to the field `url` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$url() => 192;

  /// Accessor for `url` field.
  @pragma('vm:prefer-inline')
  String? get url => this._.loadStringOrNull(_offsetOf$url(), _presenceBit$url);

  /// Offset to the field `verified` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$verified() => 17;

  /// Accessor for `verified` field.
  @pragma('vm:prefer-inline')
  bool get verified => this._.loadBool(_offsetOf$verified());

  /// Converts deserialized object into a [Map].
  ///
  /// Note: calling this would disable tree-shaking of fields.
  Map<String, dynamic> toMap({bool includeType = false}) => {
        if (includeType) r'$type': 'User',
        'contributors_enabled': this.contributors_enabled,
        'created_at': this.created_at,
        'default_profile': this.default_profile,
        'default_profile_image': this.default_profile_image,
        'description': this.description,
        'favourites_count': this.favourites_count,
        'followers_count': this.followers_count,
        'friends_count': this.friends_count,
        'geo_enabled': this.geo_enabled,
        'id': this.id,
        'is_translator': this.is_translator,
        'lang': this.lang,
        'listed_count': this.listed_count,
        'location': this.location,
        'name': this.name,
        'profile_background_color': this.profile_background_color,
        'profile_background_image_url': this.profile_background_image_url,
        'profile_background_image_url_https':
            this.profile_background_image_url_https,
        'profile_background_tile': this.profile_background_tile,
        'profile_image_url': this.profile_image_url,
        'profile_image_url_https': this.profile_image_url_https,
        'profile_link_color': this.profile_link_color,
        'profile_sidebar_border_color': this.profile_sidebar_border_color,
        'profile_sidebar_fill_color': this.profile_sidebar_fill_color,
        'profile_text_color': this.profile_text_color,
        'profile_use_background_image': this.profile_use_background_image,
        'protected': this.protected,
        'screen_name': this.screen_name,
        'show_all_inline_media': this.show_all_inline_media,
        'statuses_count': this.statuses_count,
        'url': this.url,
        'verified': this.verified,
      };
}

extension UserDecoder on Decoder<User> {
  /// Decode an [User] object from JSON bytes.
  User convert(Uint8List bytes) => UserSimdJson.$.decodeBytes(bytes);
}

extension UserListDecoder on Decoder<List<User>> {
  /// Decode a list of [User] objects from JSON bytes.
  List<User> convert(Uint8List bytes) => UserSimdJson.$list.decodeBytes(bytes);
}
