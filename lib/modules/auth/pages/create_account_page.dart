import 'package:flutter/material.dart';
import '../facades/auth_controller_facade.dart';

class CreateAccountPage extends StatelessWidget {
  final AuthControllerFacade authControllerFacade;
  const CreateAccountPage({
    Key? key,
    required this.authControllerFacade,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(authControllerFacade.user.email),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: authControllerFacade.email,
            ),
            TextField(
              controller: authControllerFacade.password,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Go to login'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Go to login'),
            ),
          ],
        ),
      ),
    );
  }
}
