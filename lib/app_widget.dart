import 'package:flutter/material.dart';
import './core/routes/routes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Multi Module App',
        initialRoute: '/login',
        onGenerateRoute: RouteGenerator.generateRoute);
  }
}
