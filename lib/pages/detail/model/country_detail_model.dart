import 'package:countries/pages/detail/model/capital_info_model.dart';
import 'package:countries/pages/detail/model/maps_model.dart';
import 'package:countries/pages/detail/model/name_symbol_model.dart';
import 'package:countries/pages/detail/model/official_common_model.dart';
import 'package:countries/pages/detail/model/postal_code_model.dart';
import 'package:countries/pages/list/model/flags_model.dart';

class CountryDetail {
  Name? name;
  List<String>? tld;
  bool? independent;
  String? status;
  bool? unMember;
  NameSymbol? currencies;
  List<String>? capital;
  List<String>? altSpellings;
  String? region;
  String? subregion;
  List<String>? languages;
  OfficialCommon? translations;
  List<double>? latLng;
  bool? landlocked;
  List<String>? borders;
  double? area;
  String? flag;
  Maps? maps;
  int? population;
  String? fifa;
  List<String>? timezones;
  List<String>? continents;
  Flags? flags;
  String? startOfWeek;
  CapitalInfo? capitalInfo;
  PostalCode? postalCode;

  CountryDetail(
      {this.name,
        this.tld,
        this.independent,
        this.status,
        this.unMember,
        this.currencies,
        this.capital,
        this.altSpellings,
        this.region,
        this.subregion,
        this.languages,
        this.translations,
        this.latLng,
        this.landlocked,
        this.borders,
        this.area,
        this.flag,
        this.maps,
        this.population,
        this.fifa,
        this.timezones,
        this.continents,
        this.flags,
        this.startOfWeek,
        this.capitalInfo,
        this.postalCode});

  CountryDetail.fromJson(Map<String, dynamic> json) {
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    tld = json['tld'].cast<String>();
    independent = json['independent'];
    status = json['status'];
    unMember = json['unMember'];
    if(json['currencies'] != null){
      json['currencies'].forEach((k,v){
        currencies = NameSymbol.fromJson(v);
      });
    }
    capital = json['capital'].cast<String>();
    altSpellings = json['altSpellings'].cast<String>();
    region = json['region'];
    subregion = json['subregion'];
    languages = json['languages'] != null
    ?json['languages'].forEach((k,v) => languages?.add(v))
    : null;
    if(json['translations'] != null){
      json['translations'].forEach((k,v){
        translations = OfficialCommon.fromJson(v);
      });
    }
    latLng = json['latlng'].cast<double>();
    landlocked = json['landlocked'];
    borders = json['borders'].cast<String>();
    area = json['area'];
    flag = json['flag'];
    maps = json['maps'] != null ? new Maps.fromJson(json['maps']) : null;
    population = json['population'];
    fifa = json['fifa'];
    timezones = json['timezones'].cast<String>();
    continents = json['continents'].cast<String>();
    flags = json['flags'] != null ? new Flags.fromJson(json['flags']) : null;
    startOfWeek = json['startOfWeek'];
    capitalInfo = json['capitalInfo'] != null
        ? new CapitalInfo.fromJson(json['capitalInfo'])
        : null;
    postalCode = json['postalCode'] != null
        ? new PostalCode.fromJson(json['postalCode'])
        : null;
  }

}

class Name {
  String? common;
  String? official;
  OfficialCommon? nativeName;

  Name({this.common, this.official, this.nativeName});

  Name.fromJson(Map<String, dynamic> json) {
    common = json['common'];
    official = json['official'];
    if(json['nativeName'] != null){
    json['nativeName'].forEach((k,v){
    nativeName = OfficialCommon.fromJson(v);
    });
    }

  }

}













