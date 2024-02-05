import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rep_route/helper/SharedPref.dart';
import 'package:rep_route/network/Apis.dart';
import 'package:rep_route/network/request/SigninRequest.dart';
import 'package:rep_route/network/response/SigninResponse.dart';
import 'package:rep_route/routes/Routes.dart';
import 'package:rep_route/utils/utils.dart';

class SignInProvider extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  late SharedPref prefs;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> signInUser(
      BuildContext context, SignInRequest signInRequest) async {
    try {
      // Set loading to true when the API call starts
      isLoading = true; 

      // Create an instance of Apis
      Apis apis = Apis.init();

      // Make the sign-up API call
      SignInResponse signInResponse =
          await apis.SignInUser(signInRequest.toJson());

      // Handle success or perform any other logic
      if (signInResponse.status == true) {
        showToast('Sign-in successful!');
        SharedPref.init().then((value) {
          value.saveUserInfo(signInRequest);
          Navigator.pushReplacementNamed(context, RoutesName.rootScreen);
        });
      } else {
        showToast('Sign-in failed');
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
