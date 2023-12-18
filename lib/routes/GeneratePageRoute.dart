import 'package:flutter/material.dart';
import 'package:rep_route/routes/Routes.dart';


class GeneratePageRoute extends PageRouteBuilder {
  final Widget widget;
  final String? routeName;
  final Map<String,dynamic>? args;

  GeneratePageRoute({required this.widget, this.routeName, this.args})
      : super(
            settings: RouteSettings(name: routeName,arguments: args),
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return widget;
            },
            transitionDuration: const Duration(milliseconds: 300),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              // if (routeName == RoutesName.searchExplorePage) {
              //   return SlideTransition(
              //     position: Tween<Offset>(
              //       begin: const Offset(0, 1),
              //       end: const Offset(.0, .0),
              //     ).animate(animation),
              //     child: child,
              //   );
              // } else if(routeName == RoutesName.portfolioComments){
              //   return SlideTransition(
              //     position: Tween<Offset>(
              //       begin: const Offset(1, 0),
              //       end: const Offset(0, 0),
              //     ).animate(animation),
              //     child: child,
              //   );
              // }else {
              //   return FadeTransition(
              //     opacity: animation,
              //     child: child,
              //   );
              // }
               return FadeTransition(
                  opacity: animation,
                  child: child,
                );
            });
}
