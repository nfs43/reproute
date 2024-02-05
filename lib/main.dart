import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rep_route/network/Apis.dart';
import 'package:rep_route/providers/dashboardProvider.dart';
import 'package:rep_route/providers/signInProvider.dart';
import 'package:rep_route/providers/signUpProvider.dart';
import 'package:rep_route/routes/RouteGenerator.dart';
import 'package:rep_route/routes/Routes.dart';
import 'package:rep_route/providers/bottomBarProvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => SignInProvider()),
    ChangeNotifierProvider(create: (context) => SignUpProvider()),
    ChangeNotifierProvider(create: (context) => BottomBarProvider()),
    ChangeNotifierProvider(create: (context) => DashboardProvider()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    Apis.init(context);

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: RoutesName.initialScreen,
    );
  }
}
