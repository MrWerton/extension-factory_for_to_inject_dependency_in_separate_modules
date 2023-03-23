// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../facade/post_controller_facade.dart';

class PostPage extends StatelessWidget {
  final PostControllerFacade postControllerFacade;
  const PostPage({
    Key? key,
    required this.postControllerFacade,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('posts'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(postControllerFacade.posts[0].title),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/login');
              },
              child: const Text('Go to login'),
            ),
          ],
        ),
      ),
    );
  }
}
