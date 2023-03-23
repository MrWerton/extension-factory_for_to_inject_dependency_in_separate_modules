import '../repositories/auth_repository.dart';

class GetPostController {
  final PostRepository _postRepository;

  GetPostController({required PostRepository postRepository})
      : _postRepository = postRepository;

  call() async {
    final posts = await _postRepository.findAllPost();

    return posts;
  }
}
