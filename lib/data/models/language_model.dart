class LanguageModel {
  String? id;
  String? locale;
  String? name;

  LanguageModel({this.id, this.locale, this.name});

  LanguageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    locale = json['locale'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['locale'] = locale;
    data['name'] = name;
    return data;
  }
}
