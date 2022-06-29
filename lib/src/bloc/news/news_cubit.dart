import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_architecture/src/provider/news_provider.dart';
import 'package:meta/meta.dart';

import '../../models/article.dart';
import '../../repository/news_repository.dart';

part 'news_state.dart';

//Este es el cubit, el que se encarga de manejar la logica de la aplicacion, este archivo es el que cambia el estado.
//El cubit, administra los estados
class NewsCubit extends Cubit<NewsState> {

  final NewsRepositoryBase _newsRepository;

  NewsCubit(this._newsRepository) : super(NewsInitialState());


  Future<void> getNews(String country) async {
    emit(NewsLoadingState());
    try {
      final news = await _newsRepository.fetchTopHeadlines(country);
      emit(NewsLoadingSuccesfullState(news));
    }on Exception catch(e){
      if(e is MissingApiKeyException){
        emit(NewsErrorState('Porfavor proveer una api key'));
      }else if(e is ApiKeyInvalidException){
        emit(NewsErrorState('La api key es invalida'));
      }else{
        emit(NewsErrorState('Ups, se ha producido un error'));
      }
    }
  }
}
