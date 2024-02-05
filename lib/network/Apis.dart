import 'dart:convert';

import 'package:flutter/widgets.dart';
//import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:rep_route/helper/SharedPref.dart';
import 'package:rep_route/network/response/SearchDoctorsResponse.dart';
import 'package:rep_route/network/response/SigninResponse.dart';
import 'package:rep_route/network/response/SignupResponse.dart';
import 'package:rep_route/network/response/SpecialityResponse.dart';
import 'package:rep_route/network/response/ZipcodeResponse.dart';
import 'package:rep_route/utils/Constants.dart';

class Apis {
  String BASE_URL = "http://ec2-54-164-64-136.compute-1.amazonaws.com:3002/v1/api";
  late http.Response response;
  SharedPref? pref;
  BuildContext? _context;
  static Apis? _api;

  Apis._() {
    SharedPref.init().then((value) {
      _api?.pref = value;
    });
  }

  static Apis init([BuildContext? context]) {
    if (_api == null) {
      _api = Apis._();
      _api!._context = context;
    }
    return _api!;
  }

  Map<String, String> _getHeaders() {
    // var _headers = {"Authorization":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJsdW1lbi1qd3QiLCJzdWIiOiJhOWE2NTFiOS1iYjVmLTQ5ODEtYjdlYy1kNmU0Y2JlOTYwMjEiLCJpYXQiOjE2NjAyMTE2NzQsImV4cCI6MTY2MDIxNTI3NH0.rPZr55IY3otXgIqQcJK81UZ07wp-k1vX_3CuMyjYghQ"};
    // SharedPref.initializePreference().then((prefs){
    //   prefs.getHeaders().then((value){
    //     if(value.authorization.isEmpty){
    //       prefs.setHeaders(_headers);
    //       headers = jsonDecode(jsonEncode(_headers).toString());
    //     }else{
    //       headers = jsonDecode(jsonEncode(value).toString());
    //     }
    //   });
    // });
    //var token = _api?.pref?.retrieveUserInfo()!.content!.elementAt(0).msg;
    //var token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzAzNzQ4OTU0LCJpYXQiOjE3MDI1MzkzNTQsImp0aSI6ImJmYTg2YTc1ZmY4YTRjOWI4YjAzNWJkNzZmZGExNzgzIiwidXNlcl9pZCI6NjQ1fQ.s_QsDdx1hCY-XlqUffKBO1-bv7WerLcGAairvnwP7tw';
    //var token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzA0OTg1ODg5LCJpYXQiOjE3MDM3NzYyODksImp0aSI6IjdmOGU0Y2NjZWRjOTQ0NGM4MWYzNTUwNzMxYTllY2EzIiwidXNlcl9pZCI6NjQ1fQ.XbZPYIhXp3bwco9EbcPqh8KPEK3XLIZNyQw6zEnNwuM';
    //print("token: " + token.toString());
    // return {
    //   "x-api-key-secret": "base64:rLyGsFMugyejBFlRrSO1xOs9RiC5iQYDRiehDTwnMRo=",
    //   "Authorization": "Bearer $token"
    // };

    // if (token!=null) {
    //   return {
    //     'Content-Type': 'application/json',
    //     "Authorization": "Bearer $token"
    //   };
    // } else {
    //   return {
    //     'Content-Type': 'application/json',
    //   };
    // }

     return {
        'Content-Type': 'application/json',
      };
  }

  Future<http.Response> _getRequest(String api, [Map<String, String>? params]) {
    Future<http.Response>? _response;
    try {
                Uri uri = Uri.parse(BASE_URL + api);

      _response = http
          .get(uri, headers: _getHeaders())
          .timeout(const Duration(seconds: 15),
              onTimeout: () => http.Response('$api timeout', 408))
          .onError(
              (error, stackTrace) => http.Response("$api error: $error", 400));
    } finally {
      _response?.then((value) {
        if (value.statusCode == 200) {
          debugPrint("$api response: " + jsonDecode(value.body).toString(),
              wrapWidth: 1024);
        } else if (value.statusCode == 401) {
          //pref!.saveUserInfo(SignInResponse());
          print("$api no auth: ${value.body.toString()}");
        } else {
          print("$api error: ${value.body.toString()}");
        }
      });
    }
    return _response;
  }

  Future<http.Response> _postRequest(
      String api, Map<String, dynamic> body) async {
    Future<http.Response>? _response;
    try {
          Uri uri = Uri.parse(BASE_URL + api);

      _response = http.post(
            uri,
            headers: _getHeaders(),
            body: jsonEncode(body),
          )
          .timeout(const Duration(seconds: 10),
              onTimeout: () => http.Response('$api timeout', 408))
          .onError((error, stackTrace) =>
              http.Response("$api error: ${error.toString}", 400));
    } catch (e, stackTrace) {
  print("Error in _postRequest: $e");
  print("Stack Trace: $stackTrace");
}
    
    finally {
      _response?.then((value) {
        if (value.statusCode == 200) {
          print("$api response: " + jsonDecode(value.body).toString());
        } else if (value.statusCode == 401) {
          //pref!.saveUserInfo(SignInResponse());
          print("$api no auth: ${value.body.toString()}");
        } else {
          print("$api error: ${value.body.toString()}");
        }
      });
    }
    return _response!;
  }

    Future<SignUpResponse> SignupUser(Map<String, dynamic> params) async {
    response = await _postRequest(Constants.EP_SIGNUP, params);
    if (response.statusCode == 200) {
      return SignUpResponse.fromJson(jsonDecode(response.body));
    } else {
      return SignUpResponse.error();
    }
  }

    Future<SignInResponse> SignInUser(Map<String, dynamic> params) async {
    response = await _postRequest(Constants.EP_SIGNIN, params);
    if (response.statusCode == 200) {
      return SignInResponse.fromJson(jsonDecode(response.body));
    } else {
      return SignInResponse.error();
    }
  }

    Future<ZipCodeResponse> getZipCodes() async {
    response = await _getRequest(Constants.EP_ZIPCODE);
    if (response.statusCode == 200) {
      return ZipCodeResponse.fromJson(jsonDecode(response.body));
    } else {
      return ZipCodeResponse.error();
    }
  }

   Future<SpecialityResponse> getSpecialities() async {
    response = await _getRequest(Constants.EP_SPECIALITY);
    if (response.statusCode == 200) {
      return SpecialityResponse.fromJson(jsonDecode(response.body));
    } else {
      return SpecialityResponse.error();
    }
  }

   Future<SearchDoctorsResponse> SearchDoctors(Map<String, dynamic> params) async {
    response = await _postRequest(Constants.EP_SEARCH_DOCTORS, params);
    if (response.statusCode == 200) {
      return SearchDoctorsResponse.fromJson(jsonDecode(response.body));
    } else {
      return SearchDoctorsResponse.error();
    }
  }

  // Future<SignInResponse> SignInUser(Map<String, dynamic> params) async {
  //   response = await _postRequest(Constants.EP_SIGNIN, params);
  //   if (response.statusCode == 200) {
  //     return SignInResponse.fromJson(jsonDecode(response.body));
  //   } else {
  //     return SignInResponse.error();
  //   }
  // }

//   Future<InvoicesRes> getInvoices(Map<String, dynamic> params) async {
//     response = await _postRequest(Constants.EP_INVOICES, params);
//     if (response.statusCode == 200) {
//       return InvoicesRes.fromJson(jsonDecode(response.body));
//     } else {
//       return InvoicesRes.error();
//     }
//   }

//   Future<TransactionsRes> getTransactions(Map<String, dynamic> params) async {
//     response = await _postRequest(Constants.EP_TRANSACTIONS, params);
//     if (response.statusCode == 200) {
//       return TransactionsRes.fromJson(jsonDecode(response.body));
//     } else {
//       return TransactionsRes.error();
//     }
//   }

// Future<CompanyResponse> getCompanyDetails() async {
//     response = await _getRequest(Constants.EP_COMPANY);
//     if (response.statusCode == 200) {
//       return CompanyResponse.fromJson(jsonDecode(response.body));
//     } else {
//       return CompanyResponse.error();
//     }
//   }


  //  Future<EmailReceiptResponse> sendTransactionReceipt(Map<String, dynamic> params) async {
  //   response = await _postRequest(Constants.EP_RECEIPT, params);
  //   if (response.statusCode == 200) {
  //     return EmailReceiptResponse.fromJson(jsonDecode(response.body));
  //   } else {
  //     return EmailReceiptResponse.error();
  //   }
  // }

  // Future<CCProfilesResponse> getCCProfiles(Map<String, String> params) async {
  //   response = await _getRequest(Constants.EP_CCPROFILES, params);
  //   if (response.statusCode == 200) {
  //     return CCProfilesResponse.fromJson(jsonDecode(response.body));
  //   } else {
  //     return CCProfilesResponse.error();
  //   }
  // }

  // Future<SignInResponse> UserExist(Map<String, String> params) async {
  //   response = await _postRequest(Constants.EP_USER_EXIST, params);
  //   if (response.statusCode == 200) {
  //     return SignInResponse.fromJson(jsonDecode(response.body));
  //   } else {
  //     return SignInResponse.error();
  //   }
  // }

  // Future<SignupResponse> SignUpUser(Map<String, String> params) async {
  //   response = await _postRequest(Constants.EP_SIGNUP, params);

  //   if (response.statusCode == 200) {
  //     return SignupResponse.fromJson(jsonDecode(response.body));
  //   } else {
  //     return SignupResponse.error();
  //   }
  // }

  // Future<InvoicesRes> getReviews(Map<String, String> params) async {
  //   print("Invoices Params: " + params.keys.toString());
  //   print("Invoices Params: " + params.values.toString());
  //   response = await _getRequest(Constants.EP_GET_REVIEWS, params);
  //   if (response.statusCode == 200) {
  //     return InvoicesRes.fromJson(jsonDecode(response.body));
  //   } else {
  //     return InvoicesRes.error();
  //   }
  // }
}
