import 'dart:convert';
import 'dart:html';

import 'package:flutter_bloc_architecture/src/models/article_response.dart';
import 'package:http/http.dart' as http;

class NewsProvider {

  static const String apiKey = "c445504975d94c28a8d8785ca475ebeb";
  static const String baseUrl = "newsapi.org";
  static const String topHeadlines = "/v2/top-headlines";
  static const String country = "co";


  final http.Client _httpClient;

  NewsProvider({http.Client? httpClient}) : _httpClient = httpClient ?? http.Client();


  Future<ArticleResponse> getTopHeadlines({
    required String endpoint,
    required Map<String, String> parameters,
  }) async {
    final url = Uri.https(baseUrl, endpoint, parameters);
    final response = await _httpClient.get(url);

    final result = ArticleResponse.fromJson(json.decode(response.body));

    if(result.status == "error") {
      throw Exception(result.message);
    }
    return result;
  }


}