import 'package:countries/pages/detail/model/country_detail_model.dart';

abstract class CountryDetailState{}
class CountryDetailInitialState extends CountryDetailState{}
class CountryDetailLoadingState extends CountryDetailState{}
class CountryDetailLoadedState extends CountryDetailState{
  final List<CountryDetail> countryDetail;

  CountryDetailLoadedState(this.countryDetail);

}
class CountryDetailErrorState extends CountryDetailState{}
class CountryDetailEmptyState extends CountryDetailState{}
