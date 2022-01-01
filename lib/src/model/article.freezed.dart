// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'article.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Article _$ArticleFromJson(Map<String, dynamic> json) {
  return _Article.fromJson(json);
}

/// @nodoc
class _$ArticleTearOff {
  const _$ArticleTearOff();

  _Article call(
      {required String id,
      required DateTime createdAt,
      required String contributorName,
      required String contributorAvatar,
      required String title,
      required String content,
      required String contentThumbnail,
      required List<String> slideshow}) {
    return _Article(
      id: id,
      createdAt: createdAt,
      contributorName: contributorName,
      contributorAvatar: contributorAvatar,
      title: title,
      content: content,
      contentThumbnail: contentThumbnail,
      slideshow: slideshow,
    );
  }

  Article fromJson(Map<String, Object?> json) {
    return Article.fromJson(json);
  }
}

/// @nodoc
const $Article = _$ArticleTearOff();

/// @nodoc
mixin _$Article {
  String get id => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get contributorName => throw _privateConstructorUsedError;
  String get contributorAvatar => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get contentThumbnail => throw _privateConstructorUsedError;
  List<String> get slideshow => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArticleCopyWith<Article> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleCopyWith<$Res> {
  factory $ArticleCopyWith(Article value, $Res Function(Article) then) =
      _$ArticleCopyWithImpl<$Res>;
  $Res call(
      {String id,
      DateTime createdAt,
      String contributorName,
      String contributorAvatar,
      String title,
      String content,
      String contentThumbnail,
      List<String> slideshow});
}

/// @nodoc
class _$ArticleCopyWithImpl<$Res> implements $ArticleCopyWith<$Res> {
  _$ArticleCopyWithImpl(this._value, this._then);

  final Article _value;
  // ignore: unused_field
  final $Res Function(Article) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? contributorName = freezed,
    Object? contributorAvatar = freezed,
    Object? title = freezed,
    Object? content = freezed,
    Object? contentThumbnail = freezed,
    Object? slideshow = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      contributorName: contributorName == freezed
          ? _value.contributorName
          : contributorName // ignore: cast_nullable_to_non_nullable
              as String,
      contributorAvatar: contributorAvatar == freezed
          ? _value.contributorAvatar
          : contributorAvatar // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      contentThumbnail: contentThumbnail == freezed
          ? _value.contentThumbnail
          : contentThumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      slideshow: slideshow == freezed
          ? _value.slideshow
          : slideshow // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$ArticleCopyWith<$Res> implements $ArticleCopyWith<$Res> {
  factory _$ArticleCopyWith(_Article value, $Res Function(_Article) then) =
      __$ArticleCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      DateTime createdAt,
      String contributorName,
      String contributorAvatar,
      String title,
      String content,
      String contentThumbnail,
      List<String> slideshow});
}

/// @nodoc
class __$ArticleCopyWithImpl<$Res> extends _$ArticleCopyWithImpl<$Res>
    implements _$ArticleCopyWith<$Res> {
  __$ArticleCopyWithImpl(_Article _value, $Res Function(_Article) _then)
      : super(_value, (v) => _then(v as _Article));

  @override
  _Article get _value => super._value as _Article;

  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? contributorName = freezed,
    Object? contributorAvatar = freezed,
    Object? title = freezed,
    Object? content = freezed,
    Object? contentThumbnail = freezed,
    Object? slideshow = freezed,
  }) {
    return _then(_Article(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      contributorName: contributorName == freezed
          ? _value.contributorName
          : contributorName // ignore: cast_nullable_to_non_nullable
              as String,
      contributorAvatar: contributorAvatar == freezed
          ? _value.contributorAvatar
          : contributorAvatar // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      contentThumbnail: contentThumbnail == freezed
          ? _value.contentThumbnail
          : contentThumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      slideshow: slideshow == freezed
          ? _value.slideshow
          : slideshow // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Article implements _Article {
  const _$_Article(
      {required this.id,
      required this.createdAt,
      required this.contributorName,
      required this.contributorAvatar,
      required this.title,
      required this.content,
      required this.contentThumbnail,
      required this.slideshow});

  factory _$_Article.fromJson(Map<String, dynamic> json) =>
      _$$_ArticleFromJson(json);

  @override
  final String id;
  @override
  final DateTime createdAt;
  @override
  final String contributorName;
  @override
  final String contributorAvatar;
  @override
  final String title;
  @override
  final String content;
  @override
  final String contentThumbnail;
  @override
  final List<String> slideshow;

  @override
  String toString() {
    return 'Article(id: $id, createdAt: $createdAt, contributorName: $contributorName, contributorAvatar: $contributorAvatar, title: $title, content: $content, contentThumbnail: $contentThumbnail, slideshow: $slideshow)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Article &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality()
                .equals(other.contributorName, contributorName) &&
            const DeepCollectionEquality()
                .equals(other.contributorAvatar, contributorAvatar) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality()
                .equals(other.contentThumbnail, contentThumbnail) &&
            const DeepCollectionEquality().equals(other.slideshow, slideshow));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(contributorName),
      const DeepCollectionEquality().hash(contributorAvatar),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(contentThumbnail),
      const DeepCollectionEquality().hash(slideshow));

  @JsonKey(ignore: true)
  @override
  _$ArticleCopyWith<_Article> get copyWith =>
      __$ArticleCopyWithImpl<_Article>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ArticleToJson(this);
  }
}

abstract class _Article implements Article {
  const factory _Article(
      {required String id,
      required DateTime createdAt,
      required String contributorName,
      required String contributorAvatar,
      required String title,
      required String content,
      required String contentThumbnail,
      required List<String> slideshow}) = _$_Article;

  factory _Article.fromJson(Map<String, dynamic> json) = _$_Article.fromJson;

  @override
  String get id;
  @override
  DateTime get createdAt;
  @override
  String get contributorName;
  @override
  String get contributorAvatar;
  @override
  String get title;
  @override
  String get content;
  @override
  String get contentThumbnail;
  @override
  List<String> get slideshow;
  @override
  @JsonKey(ignore: true)
  _$ArticleCopyWith<_Article> get copyWith =>
      throw _privateConstructorUsedError;
}
