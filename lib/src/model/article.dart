import 'package:freezed_annotation/freezed_annotation.dart';

part 'article.freezed.dart';
part 'article.g.dart';

@freezed
class Article with _$Article {
  const factory Article({
    required String id,
    required DateTime createdAt,
    required String contributorName,
    required String contributorAvatar,
    required String title,
    required String content,
    required String contentThumbnail,
    required List<String> slideshow,
  }) = _Article;

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
}
