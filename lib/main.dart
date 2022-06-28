import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_architecture/src/provider/news_provider.dart';
import 'package:flutter_bloc_architecture/src/repository/news_repository.dart';
import 'package:flutter_bloc_architecture/src/repository/news_repository_implement.dart';
import 'package:flutter_bloc_architecture/src/ui/pages/news_screen.dart';

void main() {
  final newsRepository = NewsRepositoryImpl(NewsProvider());

  //Inyectamos una unica instancia del repository a el widget MyApp
  runApp(
    RepositoryProvider<NewsRepositoryBase>(
      create: (context) => newsRepository,
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: NewsScreen()
    );
  }
}