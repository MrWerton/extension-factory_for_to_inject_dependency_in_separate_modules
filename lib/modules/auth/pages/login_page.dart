import 'package:flutter/material.dart';
import '../facades/auth_controller_facade.dart';

class LoginPage extends StatefulWidget {
  final AuthControllerFacade authControllerFacade;
  const LoginPage({
    Key? key,
    required this.authControllerFacade,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void dispose() {
    widget.authControllerFacade.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login ${widget.authControllerFacade.user.email}'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: widget.authControllerFacade.email,
            ),
            TextField(
              controller: widget.authControllerFacade.password,
            ),
            ElevatedButton(
              onPressed: () => widget.authControllerFacade.login(),
              child: const Text('login'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed('/create-account', arguments: {"name": "Hello"});
              },
              child: const Text('Go to create_account'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/post');
              },
              child: const Text('Go to post'),
            ),
          ],
        ),
      ),
    );
  }
}
