
import 'package:countries/pages/detail/model/official_common_model.dart';

class CountryName {
  String? common;
  String? official;
  List<OfficialCommon>? nativeName;

  CountryName({this.common, this.official, this.nativeName});

  CountryName.fromJson(Map<String, dynamic> json) {
    common = json['common'];
    official = json['official'];
    nativeName = json['nativeName'] != null
        ?  json['nativeName'].forEach((k,v) => nativeName?.add(OfficialCommon.fromJson(v)))
        : null;
  }

}