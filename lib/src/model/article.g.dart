// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Article _$$_ArticleFromJson(Map<String, dynamic> json) => _$_Article(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      contributorName: json['contributorName'] as String,
      contributorAvatar: json['contributorAvatar'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      contentThumbnail: json['contentThumbnail'] as String,
      slideshow:
          (json['slideshow'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_ArticleToJson(_$_Article instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'contributorName': instance.contributorName,
      'contributorAvatar': instance.contributorAvatar,
      'title': instance.title,
      'content': instance.content,
      'contentThumbnail': instance.contentThumbnail,
      'slideshow': instance.slideshow,
    };
