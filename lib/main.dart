import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:test_app/dio_adapter.dart';
import 'package:test_app/http_error_handle.dart';
import 'package:test_app/http_failures.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  final ValueNotifier<String> token = ValueNotifier('');

  final client = DioHttpAdapter(dio: Dio());

  Future<String> login() async {
    try {
      final data = await client.request(
        url: 'https://jsonplaceholder.typicode.com/posts',
        method: 'post',
        body: {
          "title": 'foo',
          "body": 'bar',
          "userId": 1,
        },
      );

      return token.value = data.data.toString();
    } on HttpFailures catch (err) {
      final error = HttpFailureHandler.getFirstError(err);

      return error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: RefreshIndicator(
        onRefresh: login,
        child: SingleChildScrollView(
            child: FutureBuilder<String>(
                future: login(),
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data!);
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                })),
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: login, child: Icon(Icons.add)),
    );
  }
}
