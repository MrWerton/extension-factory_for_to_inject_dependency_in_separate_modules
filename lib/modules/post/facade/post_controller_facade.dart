import 'package:flutter/widgets.dart';
import '../../auth/entities/user_entity.dart';
import '../controllers/get_post_controller.dart';
import '../entities/post_entity.dart';

class PostControllerFacade extends ChangeNotifier {
  final GetPostController getPostController;
  PostControllerFacade({
    required this.getPostController,
  });
  List<Post> posts = [
    Post(
        user: User(email: 'email', password: 'password'),
        title: 'title',
        body: 'body',
        id: 'id')
  ];
  Future<void> getAllPost() async {
    final postsData = await getPostController();
    posts = postsData;
  }
}
