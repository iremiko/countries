import 'package:countries/pages/list/model/country_list_model.dart';

abstract class CountryListState{}
class CountryListInitialState extends CountryListState{}
class CountryListLoadingState extends CountryListState{}
class CountryListLoadedState extends CountryListState{
  final List<CountryList> countryList;

  CountryListLoadedState(this.countryList);

}
class CountryListErrorState extends CountryListState{}
class CountryListEmptyState extends CountryListState{}
