import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_architecture/src/bloc/news_cubit.dart';


class DropDownButtonCountries extends StatefulWidget {
  const DropDownButtonCountries({Key? key}) : super(key: key);

  @override
  State<DropDownButtonCountries> createState() => _DropDownButtonCountriesState();
}

class _DropDownButtonCountriesState extends State<DropDownButtonCountries> {

  String _selectedCountry = 'CO';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 14),
      child: DropdownButton(
        value: _selectedCountry,
        icon: const Icon(Icons.arrow_downward, color: Colors.white,),
        items: <String>['CO', 'US', 'ES', 'AR'].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(setFullNameCountry(value),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w400,
              letterSpacing: .5),),
          );
        }).toList(),
        onChanged: (String? value) {
          setState(() {
            _selectedCountry = value!;
            context.read<NewsCubit>().getNews(value);
          });
        },
        elevation: 16,
        underline: Container(
          height: 2,
          color: Colors.lightBlueAccent,
        ),
        dropdownColor: Colors.white,
      ),
    );
  }
}

String setFullNameCountry(value){
  switch (value) {
    case 'CO':
      return 'Colombia';
    case 'US':
      return 'Estados Unidos';
    case 'ES':
      return 'España';
    case 'AR':
      return 'Argentina';
    default:
      return 'Colombia';
  }
}