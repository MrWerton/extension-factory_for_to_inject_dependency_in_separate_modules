import 'package:flutter/material.dart';
import 'package:test_app/modules/auth/auth_module.dart';
import 'package:test_app/modules/post/post_module.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 500),
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return AuthModule().getPage(path: '/login', context: context);
          },
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      case '/create-account':
        final args = settings.arguments as Map<String, dynamic>;

        return PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 500),
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return AuthModule()
                .getPage(path: '/create-account', context: context, args: args);
          },
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      case '/post':
        return MaterialPageRoute(
            builder: (context) =>
                PostModule().getPage(path: '/post', context: context));

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Route not found.'),
            ),
          ),
        );
    }
  }
}
