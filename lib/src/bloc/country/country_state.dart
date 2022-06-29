
part of 'country_cubit.dart';

abstract class CountryState{}

//Estado para cuando se selecciona un pais
class CountrySelected extends CountryState{
  final String country;
  CountrySelected(this.country);
}