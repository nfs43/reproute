import 'dart:convert';

SpecialityResponse welcomeFromJson(String str) => SpecialityResponse.fromJson(json.decode(str));

String welcomeToJson(SpecialityResponse data) => json.encode(data.toJson());

class SpecialityResponse {
    bool? status;
    List<String>? content;
    List<dynamic>? validation;

    SpecialityResponse({
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

    factory SpecialityResponse.fromJson(Map<String, dynamic> json) => SpecialityResponse(
        status: json["status"],
        content: json["content"] == null ? [] : List<String>.from(json["content"]!.map((x) => x)),
        validation: json["validation"] == null ? [] : List<dynamic>.from(json["validation"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "content": content == null ? [] : List<dynamic>.from(content!.map((x) => x)),
        "validation": validation == null ? [] : List<dynamic>.from(validation!.map((x) => x)),
    };

    static SpecialityResponse error() {
    return SpecialityResponse();
  }
}
