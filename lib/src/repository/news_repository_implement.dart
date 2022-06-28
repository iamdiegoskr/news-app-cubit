import 'package:flutter_bloc_architecture/src/models/article.dart';
import 'package:flutter_bloc_architecture/src/provider/news_provider.dart';
import 'package:flutter_bloc_architecture/src/repository/news_repository.dart';

class NewsRepositoryImpl implements NewsRepositoryBase {

  final NewsProvider _newsProvider;

  NewsRepositoryImpl(this._newsProvider);

  @override
  Future<List<Article>> fetchTopHeadlines(String country) => _newsProvider.fetchTopHeadlines(country);

}