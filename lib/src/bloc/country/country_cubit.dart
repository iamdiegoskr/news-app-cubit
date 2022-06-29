
import 'package:flutter_bloc/flutter_bloc.dart';

part 'country_state.dart';

class CountryCubit extends Cubit<CountryState> {

  CountryCubit() : super(CountrySelected('CO'));

  void changeCountry(String country) {
    emit(CountrySelected(country));
  }

}