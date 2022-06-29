part of 'news_cubit.dart';

//Engloba todos los posibles estados que nuestros noticias pueden tener.

@immutable
abstract class NewsState extends Equatable {

  @override
  List<Object> get props => [];
}

//Estado inicial, cuando no se ha cargado nada.
class NewsInitialState extends NewsState {}

//Estado de carga, cuando hacemos la peticion a la API.
class NewsLoadingState extends NewsState {}

//Cuando la api ya se cargo exitosamente.
class NewsLoadingSuccesfullState extends NewsState{
  final List<Article> news;

  NewsLoadingSuccesfullState(this.news);

  @override
  List<Object> get props => [news];
}

//Cuando se presente algun error, al llamar la api.
class NewsErrorState extends NewsState{

  final String message;

  NewsErrorState(this.message);

  @override
  List<Object> get props => [];
}

