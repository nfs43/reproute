// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

SearchDoctorsResponse welcomeFromJson(String str) => SearchDoctorsResponse.fromJson(json.decode(str));

String welcomeToJson(SearchDoctorsResponse data) => json.encode(data.toJson());

class SearchDoctorsResponse {
    bool? status;
    List<Content>? content;
    List<dynamic>? validation;

    SearchDoctorsResponse({
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

    factory SearchDoctorsResponse.fromJson(Map<String, dynamic> json) => SearchDoctorsResponse(
        status: json["status"],
        content: json["content"] == null ? [] : List<Content>.from(json["content"]!.map((x) => Content.fromJson(x))),
        validation: json["validation"] == null ? [] : List<dynamic>.from(json["validation"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "content": content == null ? [] : List<dynamic>.from(content!.map((x) => x.toJson())),
        "validation": validation == null ? [] : List<dynamic>.from(validation!.map((x) => x)),
    };

    static SearchDoctorsResponse error() {
    return SearchDoctorsResponse();
  }
}

class Content {
    String? id;
    String? firstname;
    String? middlename;
    String? lastname;
    String? zipcode;
    String? type;
    String? speciaciality;
    String? address;
    String? createdAt;
    String? updatedAt;
    dynamic deletedAt;

    Content({
        this.id,
        this.firstname,
        this.middlename,
        this.lastname,
        this.zipcode,
        this.type,
        this.speciaciality,
        this.address,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
    });

    factory Content.fromJson(Map<String, dynamic> json) => Content(
        id: json["id"],
        firstname: json["firstname"],
        middlename: json["middlename"],
        lastname: json["lastname"],
        zipcode: json["zipcode"],
        type: json["type"],
        speciaciality: json["speciaciality"],
        address: json["address"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        deletedAt: json["deletedAt"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "firstname": firstname,
        "middlename": middlename,
        "lastname": lastname,
        "zipcode": zipcode,
        "type": type,
        "speciaciality": speciaciality,
        "address": address,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "deletedAt": deletedAt,
    };
}
