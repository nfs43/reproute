

import 'dart:convert';

SignUpRequest welcomeFromJson(String str) => SignUpRequest.fromJson(json.decode(str));

String welcomeToJson(SignUpRequest data) => json.encode(data.toJson());

class SignUpRequest {
    String? email;
    bool? issocial;
    String? password;
    String? fullName;
    String? companyName;
    String? socialToken;
    String? googleToken;
    String? facebookToken;

    SignUpRequest({
        this.email,
        this.issocial,
        this.password,
        this.fullName,
        this.companyName,
        this.socialToken,
        this.googleToken,
        this.facebookToken,
    });

    factory SignUpRequest.fromJson(Map<String, dynamic> json) => SignUpRequest(
        email: json["email"],
        issocial: json["issocial"],
        password: json["password"],
        fullName: json["fullName"],
        companyName: json["companyName"],
        socialToken: json["socialToken"],
        googleToken: json["googleToken"],
        facebookToken: json["facebookToken"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "issocial": issocial,
        "password": password,
        "fullName": fullName,
        "companyName": companyName,
        "socialToken": socialToken,
        "googleToken": googleToken,
        "facebookToken": facebookToken,
    };
}
