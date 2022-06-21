import 'package:json_annotation/json_annotation.dart';
import 'article.dart';

part 'article_response.g.dart';

@JsonSerializable()
class ArticleResponse {

  late final String status;
  late final String? code;
  late final String? message;
  late final List<Article>? articles;

  ArticleResponse({
    required this.status,
    this.code,
    this.message,
    this.articles,
  });

  factory ArticleResponse.fromJson(Map<String, dynamic> json) =>
      _$ArticleResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleResponseToJson(this);

}