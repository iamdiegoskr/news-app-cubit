import 'dart:io';

import 'package:flutter_bloc_architecture/src/provider/news_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

void main() {

  test('top headlines response is correct', () async {
    final provider = _getProvider('test/provider/top_headlines.json');
    final articles = await provider.fetchTopHeadlines();
    expect(articles.length, 3);
    expect(articles[0].title, 'Dólar cerró a \$ 4.026; terminó subiendo \$ 121 tras resultado de elecciones - El Tiempo');
    expect(articles[1].author, 'El Colombiano');
  });


}

  NewsProvider _getProvider(String filePath)=> NewsProvider(httpClient: _getMockProvider(filePath));

  MockClient _getMockProvider(String filePath)=> MockClient((_) async {
    return Response(await File(filePath).readAsString(), 200, headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
    });
  });