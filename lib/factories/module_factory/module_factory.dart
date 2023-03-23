import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

typedef PageBuild = Widget Function(
    BuildContext context, Map<String, dynamic>? args);
typedef Bind = List<SingleChildWidget>?;
typedef Routers = Map<String, PageBuild>;

abstract class ModuleFactory {
  Routers get routers;
  Bind? get bindings;

  Widget getPage(
      {required String path,
      required BuildContext context,
      Map<String, dynamic>? args}) {
    final pageBuilder = routers[path];
    if (pageBuilder != null) {
      return MultiProvider(
        builder: (context, child) => Builder(
          builder: (
            context,
          ) =>
              pageBuilder(context, args),
        ),
        providers: bindings ?? [Provider(create: (_) => Object())],
      );
    }
    throw Exception();
  }
}
