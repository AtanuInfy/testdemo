import 'dart:convert';

SdkResult sdkResultFromJson(String str) => SdkResult.fromJson(json.decode(str));

class SdkResult {
  SdkResult({
    this.failure,
    this.success,
  });

  bool isSuccess() {
    return success != null;
  }

  Failure? failure;
  dynamic success;

  factory SdkResult.fromJson(Map<String, dynamic> json) => SdkResult(
      failure: json["failure"] == null
          ? null
          : Failure.fromJson(Map<String, dynamic>.from(json["failure"])),
      success: json["success"]);
}

class Failure {
  Failure({
    required this.errorCode,
    required this.errorDesc,
  });

  String errorCode;
  String errorDesc;

  factory Failure.fromJson(Map<String, dynamic> json) => Failure(
        errorCode: json["errorCode"],
        errorDesc: json["errorDesc"],
      );
}
