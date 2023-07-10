import 'package:countries/pages/list/model/country_name_model.dart';
import 'package:countries/pages/list/model/flags_model.dart';

class CountryList {
  Flags? flags;
  CountryName? name;

  CountryList({this.flags, this.name});

  CountryList.fromJson(Map<String, dynamic> json) {
    flags = json['flags'] != null ? new Flags.fromJson(json['flags']) : null;
    name = json['name'] != null ? new CountryName.fromJson(json['name']) : null;
  }

}










