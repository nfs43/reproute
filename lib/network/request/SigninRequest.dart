import 'dart:convert';

SignInRequest welcomeFromJson(String str) =>
    SignInRequest.fromJson(json.decode(str));

String welcomeToJson(SignInRequest data) => json.encode(data.toJson());

class SignInRequest {
  String? email;
  bool? issocial;
  String? password;
  String? googleToken;
  String? facebookToken;
  String? socialToken;

  SignInRequest({
    this.email,
    this.issocial,
    this.password,
    this.googleToken,
    this.facebookToken,
    this.socialToken,
  });

  factory SignInRequest.fromJson(Map<String, dynamic> json) => SignInRequest(
        email: json["email"],
        issocial: json["issocial"],
        password: json["password"],
        googleToken: json["googleToken"],
        facebookToken: json["facebookToken"],
        socialToken: json["socialToken"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "issocial": issocial,
        "password": password,
        "googleToken": googleToken,
        "facebookToken": facebookToken,
        "socialToken": socialToken,
      };
}
