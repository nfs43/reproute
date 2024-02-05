// import 'dart:convert';
// import 'dart:math';
// import 'package:viaoptimus_cp/helper/SharedPref.dart';
// import 'package:viaoptimus_cp/providers/AuthProvider.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:http/http.dart' as http;
// import 'package:provider/provider.dart';

// class Auth {
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//   late SharedPref prefs;
//   Future<dynamic> signInFB(BuildContext context) async {
//     SharedPref.init().then((value) {
//       prefs = value;
//     });
//     final LoginResult loginResult = await FacebookAuth.instance
//         .login(permissions: ["email,public_profile"])
//         .timeout(Duration(seconds: 15),
//             onTimeout: () => LoginResult(status: LoginStatus.failed))
//         .onError((error, stackTrace) =>
//             LoginResult(status: LoginStatus.failed, message: ""));
//     if (loginResult.status != LoginStatus.success) {
//       return 0;
//     } else {
//       prefs.setHeaders({"token":loginResult.accessToken!.token.toString()});
//       final OAuthCredential facebookAuthCredential =
//           await FacebookAuthProvider.credential(loginResult.accessToken!.token);
//       return _firebaseAuth
//           .signInWithCredential(facebookAuthCredential)
//           .timeout(Duration(seconds: 15));
//     }
//   }

//   Future signOutFb(BuildContext context) async {
//     print("Logging out");
//     await _firebaseAuth.signOut().whenComplete(() =>
//         Provider.of<AuthProvider>(context, listen: false)
//             .onLoginStatusChanged(false));
//   }
// }
