import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc_architecture/src/bloc/news_cubit.dart';
import 'package:flutter_bloc_architecture/src/models/article.dart';
import 'package:flutter_bloc_architecture/src/provider/news_provider.dart';
import 'package:flutter_bloc_architecture/src/repository/news_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'news_cubit_test.mocks.dart';

@GenerateMocks([
  NewsRepositoryBase
])
void main() {

  group('Cubit test', () {

    final mockRepository = MockNewsRepositoryBase();
    final article = Article(title: 'Messi cumple 35 años', author: 'Elpais.com',);

    blocTest<NewsCubit, NewsState>('Test get news will be loaded correctly', build: (){
      when(mockRepository.fetchTopHeadlines('CO')).thenAnswer((_) async => [article]);
      return NewsCubit(mockRepository);
    },
    act: (bloc) => bloc.getNews('CO'),
    expect: ()=> [
      NewsLoadingState(),
      NewsLoadingSuccesfullState([article])
    ]);

    blocTest<NewsCubit, NewsState>('Test Apy Key exception is handle correctly', build: (){
      when(mockRepository.fetchTopHeadlines('CO')).thenThrow(ApiKeyInvalidException());
      return NewsCubit(mockRepository);
    },
    act: (bloc) => bloc.getNews('CO'),
    expect: ()=> [
      NewsLoadingState(),
      NewsErrorState('La api key es invalida')
      ]
    );

    blocTest<NewsCubit, NewsState>('Test Missing Api Key is handle correclty', build: (){
      when(mockRepository.fetchTopHeadlines('CO')).thenThrow(MissingApiKeyException());
      return NewsCubit(mockRepository);
    },
    act: (bloc) => bloc.getNews('CO'),
    expect: ()=> [
      NewsLoadingState(),
      NewsErrorState('Porfavor proveer una api key')
      ]
    );

  });
}