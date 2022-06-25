import 'package:flutter_bloc_architecture/src/models/article.dart';

abstract class NewsRepositoryBase{

  Future<List<Article>> fetchTopHeadlines();

}