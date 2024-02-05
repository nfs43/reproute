// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

SearchDoctorsRequest welcomeFromJson(String str) => SearchDoctorsRequest.fromJson(json.decode(str));

String welcomeToJson(SearchDoctorsRequest data) => json.encode(data.toJson());

class SearchDoctorsRequest {
    FilterObj? filterObj;

    SearchDoctorsRequest({
        this.filterObj,
    });

    factory SearchDoctorsRequest.fromJson(Map<String, dynamic> json) => SearchDoctorsRequest(
        filterObj: json["filterObj"] == null ? null : FilterObj.fromJson(json["filterObj"]),
    );

    Map<String, dynamic> toJson() => {
        "filterObj": filterObj?.toJson(),
    };
}

class FilterObj {
    dynamic speciaciality;
    dynamic zipcode;

    FilterObj({
        this.speciaciality,
        this.zipcode
    });

    factory FilterObj.fromJson(Map<String, dynamic> json) => FilterObj(
        speciaciality: json["speciaciality"],
        zipcode: json["zipcode"],
    );

    Map<String, dynamic> toJson() => {
        "speciaciality": speciaciality,
        "zipcode": zipcode,
    };
}
