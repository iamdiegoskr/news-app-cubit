import 'dart:convert';

import 'package:flutter_bloc_architecture/src/models/article.dart';
import 'package:flutter_bloc_architecture/src/models/article_response.dart';
import 'package:http/http.dart' as http;


class MissingApiKeyException implements Exception{}
class ApiKeyInvalidException implements Exception{}

class NewsProvider {

  static const String _apiKey = "c445504975d94c28a8d8785ca475ebeb";
  static const String baseUrl = "newsapi.org";
  static const String _topHeadlines = "/v2/top-headlines";
  static const String _country = "co";


  final http.Client _httpClient;

  NewsProvider({http.Client? httpClient}) : _httpClient = httpClient ?? http.Client();


  Future<List<Article>> fetchTopHeadlines() async {
    final ArticleResponse response = await _callGetApi(endpoint: _topHeadlines, parameters: {
      "country": _country,
      "apiKey": _apiKey
    });

    return response.articles ?? [];

  }

  Future<ArticleResponse> _callGetApi({
    required String endpoint,
    required Map<String, String> parameters,
  }) async {
    final url = Uri.https(baseUrl, endpoint, parameters);
    final response = await _httpClient.get(url);

    final result = ArticleResponse.fromJson(json.decode(response.body));

    if(result.status == "error") {
      if(result.code == "apiKeyMissing") throw MissingApiKeyException();
      if(result.code == "apiKeyInvalid") throw ApiKeyInvalidException();
      throw Exception();
    }
    return result;
  }


}


