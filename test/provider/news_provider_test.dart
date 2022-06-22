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
  });


}

  NewsProvider _getProvider(String filePath)=> NewsProvider(httpClient: _getMockProvider(filePath));

  MockClient _getMockProvider(String filePath)=> MockClient((_) async {
    return Response(await File(filePath).readAsString(), 200, headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
    });
  });