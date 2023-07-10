import 'dart:convert';

import 'package:countries/api/api_methods.dart';
import 'package:countries/pages/detail/model/country_detail_model.dart';
import 'package:countries/pages/list/model/country_list_model.dart';

class ApiCall {
  String  url = "restcountries.com";
  String path = "v3.1";


  Future<List<CountryList>> getCountryList() async{
    Uri uri = Uri.https(url, "$path/all",{
      "fields":"name,flags"
    });

    final response = await ApiMethods.getMethods(uri);
    final jsonDecoded = json.decode(response.body);

    final result = (jsonDecoded as List).map((e) => CountryList.fromJson(e)).toList();
    return result;
  }

  Future<List<CountryDetail>> getCountryDetail(String countryName) async{
    Uri uri = Uri.https(url, "$path/name/$countryName",);

    final response = await ApiMethods.getMethods(uri);
    final jsonDecoded = json.decode(response.body);

    final result = (jsonDecoded as List).map((e) => CountryDetail.fromJson(e)).toList();
    return result;
  }
}
