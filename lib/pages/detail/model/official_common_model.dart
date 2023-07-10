
class OfficialCommon {
  String? official;
  String? common;

  OfficialCommon({this.official, this.common});

  OfficialCommon.fromJson(Map<String, dynamic> json) {
    official = json['official'];
    common = json['common'];
  }
}
