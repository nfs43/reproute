import 'dart:convert';

SignUpResponse welcomeFromJson(String str) =>
    SignUpResponse.fromJson(json.decode(str));

String welcomeToJson(SignUpResponse data) => json.encode(data.toJson());

class SignUpResponse {

  SignUpResponse({
    bool? status = false,
    List<Content>? content,
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

    bool? status;
    List<Content>? content;
    List<dynamic>? validation;

  factory SignUpResponse.fromJson(Map<String, dynamic> json) => SignUpResponse(
        status: json["status"],
        content: json["content"] == null
            ? []
            : List<Content>.from(
                json["content"]!.map((x) => Content.fromJson(x))),
        validation: json["validation"] == null
            ? []
            : List<dynamic>.from(json["validation"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "content": content == null
            ? []
            : List<dynamic>.from(content!.map((x) => x.toJson())),
        "validation": validation == null
            ? []
            : List<dynamic>.from(validation!.map((x) => x)),
      };

      static SignUpResponse error() {
    return SignUpResponse();
  }
}

class Content {
  String? msg;

  Content({
    this.msg,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
      };
}
