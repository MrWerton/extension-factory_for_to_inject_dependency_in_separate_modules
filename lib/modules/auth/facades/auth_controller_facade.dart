import 'package:flutter/material.dart';
import 'package:test_app/infra/http/http_error_handle.dart';
import 'package:test_app/infra/http/http_failures.dart';
import 'package:test_app/modules/auth/entities/user_entity.dart';

import '../repositories/dto/login_params_dto.dart';
import '../usecases/login_usecase.dart';

class AuthControllerFacade extends ChangeNotifier {
  final LoginUseCase loginUseCase;
  final User user = User.empty();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  AuthControllerFacade({
    required this.loginUseCase,
  });

  Future<void> login() async {
    try {
      final loginDto = LoginDto(email: email.text, password: password.text);
      await loginUseCase.call(loginDto: loginDto);
    } on HttpFailures catch (err) {
      final error = HttpFailureHandler.getFirstError(err);
      print(error);
    }
  }

  Future<void> createAccount() {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();

    super.dispose();
  }
}
