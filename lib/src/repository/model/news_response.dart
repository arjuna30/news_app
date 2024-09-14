import 'package:json_annotation/json_annotation.dart';

part 'news_response.g.dart';

@JsonSerializable()
class NewsDetail {
  static const fromJsonFactory = _$NewsDetailFromJson;

  NewsDetail({
    required this.sourceName,
    this.author,
    required this.title,
    this.description = '-',
    this.url = '-',
    this.urlToImage,
    required this.publishedAt,
  });

  @JsonKey(name: 'source', fromJson: _sourceNameFromJson)
  final String sourceName;
  final String? author;
  final String title;
  final String description;
  final String url;
  final String? urlToImage;
  final DateTime publishedAt;

  static String _sourceNameFromJson(dynamic value) => value['name'] ?? '-';
  factory NewsDetail.fromJson(dynamic json) => _$NewsDetailFromJson(json);
}
