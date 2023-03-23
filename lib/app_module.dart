import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './infra/http/client_adapter.dart';
import './infra/http/dio_adapter.dart';
import './app_widget.dart';

class AppModule extends StatelessWidget {
  const AppModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      Provider<Dio>(
        create: (context) => Dio(),
      ),
      Provider<ClientAdapter>(
        create: (context) => DioAdapter(client: context.read()),
      )
    ], child: const AppWidget());
  }
}
