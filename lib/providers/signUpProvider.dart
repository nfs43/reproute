import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rep_route/helper/SharedPref.dart';
import 'package:rep_route/network/Apis.dart';
import 'package:rep_route/network/request/SignupRequest.dart';
import 'package:rep_route/network/response/SignupResponse.dart';
import 'package:rep_route/routes/Routes.dart';
import 'package:rep_route/utils/utils.dart';

class SignUpProvider extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  late SharedPref prefs;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> signUpUser(
      BuildContext context, SignUpRequest signUpRequest) async {
    try {
      isLoading = true; // Set loading to true when the API call starts

      // Create an instance of Apis
      Apis apis = Apis.init();

      // Make the sign-up API call
      SignUpResponse signUpResponse =
          await apis.SignupUser(signUpRequest.toJson());

      // Handle success or perform any other logic
      if (signUpResponse.status == true) {
        showToast('Sign-up successful!');
        SharedPref.init().then((value) {
          value.saveUserInfo(signUpRequest);
          Navigator.pushReplacementNamed(context, RoutesName.rootScreen);
        });
      } else {
        showToast('Sign-up failed');
      }

      // Handle success or perform any other logic
    } catch (error) {
      // Handle errors and show error messages
    } finally {
          await FirebaseAuth.instance.signOut();

      isLoading = false; // Set loading to false after API call completes
    }
  }
}
