import 'package:flutter/material.dart';
import 'package:rep_route/routes/RouteGenerator.dart';
import 'package:rep_route/routes/Routes.dart';


void main() {
  runApp(const MyApp());
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
