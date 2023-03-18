import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/provider.dart';

typedef Bind = List<SingleChildWidget>?;
typedef Routers = Map<String, WidgetBuilder>;

abstract class ModuleFactory {
  final Routers _routers;
  final Bind? _bindings;

  ModuleFactory({Bind? bindings, required Routers routers})
      : _routers = routers,
        _bindings = bindings;

  Routers get routers {
    return _routers.map(
      (key, pageBuilder) => MapEntry(
        key,
        (_) => MultiProvider(
          providers: _bindings ?? [Provider(create: (_) => Object())],
          child: Builder(builder: (context) => pageBuilder(context)),
        ),
      ),
    );
  }

  Widget getPage(String path, BuildContext context) {
    final widgetBuilder = _routers[path];
    if (widgetBuilder != null) {
      return MultiProvider(
        builder: (context, child) => Builder(
          builder: (context) => widgetBuilder(context),
        ),
        providers: _bindings ?? [Provider(create: (_) => Object())],
      );
    }
    throw Exception();
  }

  void onModuleActivate() {}

  void onModuleDeactivate() {}
}

class HomeModule extends ModuleFactory {
  HomeModule()
      : super(
          routers: {
            '/': (_) => Scaffold(
                  appBar: AppBar(
                    title: Text('First Module'),
                  ),
                  body: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        final navigator = Navigator.of(_);
                        navigator.pushNamed('/second');
                      },
                      child: Text('Go to Second Module'),
                    ),
                  ),
                ),
            '/top': (_) => Scaffold(
                  appBar: AppBar(
                    title: Text('top'),
                  ),
                  body: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        final navigator = Navigator.of(_);
                        navigator.pushNamed('/');
                      },
                      child: Text('Go to first Module'),
                    ),
                  ),
                ),
          },
        );
  @override
  void onModuleActivate() {
    print('Second module activated');
  }

  @override
  void onModuleDeactivate() {
    print('Second module deactivated');
  }
}

class SecondModule extends ModuleFactory {
  SecondModule()
      : super(
          routers: {
            '/second': (_) => Scaffold(
                  appBar: AppBar(
                    title: Text('Second Module'),
                  ),
                  body: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        final navigator = Navigator.of(_);
                        navigator.pushNamed('/top');
                      },
                      child: Text('Go to First Module'),
                    ),
                  ),
                ),
          },
        );
  @override
  void onModuleActivate() {
    print('Second module activated');
  }

  @override
  void onModuleDeactivate() {
    print('Second module deactivated');
  }
}

void main() {
  runApp(
    MaterialApp(
      title: 'Multi Module App',
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 500),
              pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) {
                return HomeModule().getPage('/', context);
              },
              transitionsBuilder: (BuildContext context,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                  Widget child) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1, 0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );
              },
            );
          case '/top':
            return PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 500),
              pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) {
                return HomeModule().getPage('/top', context);
              },
              transitionsBuilder: (BuildContext context,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                  Widget child) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1, 0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );
              },
            );

          case '/second':
            return PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 500),
              pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) {
                return SecondModule().getPage('/second', context);
              },
              transitionsBuilder: (BuildContext context,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                  Widget child) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1, 0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );
              },
            );

          default:
            return MaterialPageRoute(
              builder: (_) => Scaffold(
                body: Center(
                  child: Text('Route not found.'),
                ),
              ),
            );
        }
      },
    ),
  );
}
