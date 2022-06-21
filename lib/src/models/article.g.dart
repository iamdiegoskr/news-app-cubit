// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) => Article(
      title: json['title'] as String,
      autor: json['autor'] as String?,
      description: json['description'] as String?,
      urlToImage: json['urlToImage'] as String?,
      content: json['content'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'title': instance.title,
      'autor': instance.autor,
      'description': instance.description,
      'urlToImage': instance.urlToImage,
      'content': instance.content,
      'url': instance.url,
    };
