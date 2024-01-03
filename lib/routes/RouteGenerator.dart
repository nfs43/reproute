import 'package:flutter/material.dart';

import 'package:rep_route/routes/GeneratePageRoute.dart';
import 'package:rep_route/routes/Routes.dart';
import 'package:rep_route/screens/forgotpassword.dart';
import 'package:rep_route/screens/login.dart';
import 'package:rep_route/screens/resetpassword.dart';
import 'package:rep_route/screens/root/root.dart';
import 'package:rep_route/screens/signup.dart';
import 'package:rep_route/screens/splash.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.initialScreen:
        return GeneratePageRoute(
            widget: SplashScreen(), routeName: settings.name);
      case RoutesName.loginScreen:
        return GeneratePageRoute(
            widget: LoginScreen(), routeName: settings.name);
      case RoutesName.signUpScreen:
        return GeneratePageRoute(
            widget: SignUpScreen(), routeName: settings.name);
      case RoutesName.forgotPasswordScreen:
        return GeneratePageRoute(
            widget: ForgotPasswordScreen(), routeName: settings.name);
      case RoutesName.resetPasswordScreen:
        return GeneratePageRoute(
            widget: ResetPasswordScreen(), routeName: settings.name);
      case RoutesName.rootScreen:
        return GeneratePageRoute(
            widget: RootScreen(), routeName: settings.name);
      // case RoutesName.appointmentPage:
      //   return GeneratePageRoute(
      //       widget: WishListScreen(), routeName: settings.name);
      // case RoutesName.inboxPage:
      //   return GeneratePageRoute(
      //       widget: WishListScreen(), routeName: settings.name);
      // case RoutesName.profilePage:
      //   return GeneratePageRoute(
      //       widget: WishListScreen(), routeName: settings.name);
      // case RoutesName.storeDetailPage:
      //   return GeneratePageRoute(
      //       widget: StoreDetailScreen(),
      //       routeName: settings.name,
      //       args: settings.arguments as Map<String, dynamic>);
      // case RoutesName.portfolioComments:
      //   return GeneratePageRoute(
      //       widget: PortfolioCommentsScreen(),
      //       routeName: settings.name,
      //       args: settings.arguments as Map<String, dynamic>);
      // case RoutesName.searchExplorePage:
      //   return GeneratePageRoute(
      //       widget: FilterScreen(), routeName: settings.name);
      // case RoutesName.appointmentbookingPage:
      //   return GeneratePageRoute(
      //       widget: AppointmentBookingPage(), routeName: settings.name);
      // case RoutesName.signInPage:
      //   return GeneratePageRoute(
      //       widget: SignInScreen(), routeName: settings.name);
      // case RoutesName.signUpPage:
      //   return GeneratePageRoute(
      //       widget: SignupScreen(), routeName: settings.name);
      // case RoutesName.favStoresPage:
      //   return GeneratePageRoute(
      //       widget: WishlistStoreScreen(),
      //       routeName: settings.name,
      //       args: settings.arguments as Map<String, String>);
      // case RoutesName.bookservicesWebviewPage:
      //   return GeneratePageRoute(
      //       widget: BookServicesPage(),
      //       routeName: settings.name,
      //       args: {'Storedetails': Data} );
      // case RoutesName.privacypolicyWebviewPagePage:
      //   return GeneratePageRoute(
      //       widget: PrivacyPolicyPage(),
      //       routeName: settings.name,
      //       args: settings.arguments as Map<String, String>);
      // case RoutesName.profiledetailPage:
      //   return GeneratePageRoute(
      //       widget: ProfileDetailScreen(),
      //       routeName: settings.name,
      //       args: settings.arguments as Map<String, String>);
      default:
        return GeneratePageRoute(
            widget: LoginScreen(), routeName: settings.name);
    }
  }
}
