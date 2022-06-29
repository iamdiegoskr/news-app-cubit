
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_architecture/src/bloc/news/news_cubit.dart';
import 'package:flutter_bloc_architecture/src/repository/news_repository.dart';
import 'package:flutter_bloc_architecture/src/ui/widgets/dropdown_country.dart';

import '../../bloc/country/country_cubit.dart';
import '../widgets/list_news.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final repository = context.read<NewsRepositoryBase>();

    return MultiBlocProvider(
      providers: [
        BlocProvider<NewsCubit>(
          create: (_) => NewsCubit(repository)..getNews('CO'),
        ),
        BlocProvider<CountryCubit>(
          create: (_) => CountryCubit(),
        )
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Noticias'),
          elevation: 0,
          actions: const [
            DropDownButtonCountries(),
          ],
        ),
        body: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state){
            if(state is NewsLoadingState){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }else if(state is NewsErrorState){
              return Center(
                child: Text(state.message,
                  style: const TextStyle(color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),),
              );
            }
            if((state as NewsLoadingSuccesfullState).news.isEmpty){
              return const Center(
                child: Text('No hay noticias actualmente'),
              );
            }
            return BlocBuilder<CountryCubit,CountryState>(
              builder: (context, stateCountry){
                String country = (stateCountry as CountrySelected).country;
                return RefreshIndicator(
                  onRefresh: () => context.read<NewsCubit>().getNews(country),
                  child: ListNews(
                    news: (state).news,
                  ),
              );
              }
            );
          },
        )
      )
    );
  }
}


