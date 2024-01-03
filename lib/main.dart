import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rep_route/routes/RouteGenerator.dart';
import 'package:rep_route/routes/Routes.dart';
import 'package:rep_route/providers/BottomBarProvider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => BottomBarProvider()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: RoutesName.initialScreen,
    );
  }
}
