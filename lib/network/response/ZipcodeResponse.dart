// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

ZipCodeResponse welcomeFromJson(String str) =>
    ZipCodeResponse.fromJson(json.decode(str));

String welcomeToJson(ZipCodeResponse data) => json.encode(data.toJson());

class ZipCodeResponse {
  bool? status;
  List<String>? content;
  List<dynamic>? validation;

  ZipCodeResponse({
    bool? status = false,
    List<String>? content,
    List<dynamic>? validation,
  }) {
    if (status != null) {
      this.status = status;
    }
    if (content != null) {
      this.content = content;
    }
    if (validation != null) {
      this.validation = validation;
    }
  }

  factory ZipCodeResponse.fromJson(Map<String, dynamic> json) =>
      ZipCodeResponse(
        status: json["status"],
        content: json["content"] == null
            ? []
            : List<String>.from(json["content"]!.map((x) => x)),
        validation: json["validation"] == null
            ? []
            : List<dynamic>.from(json["validation"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "content":
            content == null ? [] : List<dynamic>.from(content!.map((x) => x)),
        "validation": validation == null
            ? []
            : List<dynamic>.from(validation!.map((x) => x)),
      };

  static ZipCodeResponse error() {
    return ZipCodeResponse();
  }
}
