import 'package:ItemOptix/data/models/language_model.dart';

class UserModel {
  String? email;
  String? firstName;
  LanguageModel? language;
  String? lastName;
  String? role;
  String? username;

  UserModel(
      {required this.email,
      required this.firstName,
      required this.language,
      required this.lastName,
      required this.role,
      required this.username});

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    firstName = json['firstName'];
    language = json['language'] != null
        ? LanguageModel.fromJson(json['language'])
        : null;
    lastName = json['lastName'];
    role = json['role'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['firstName'] = firstName;
    if (language != null) {
      data['language'] = language!.toJson();
    }
    data['lastName'] = lastName;
    data['role'] = role;
    data['username'] = username;
    return data;
  }
}
