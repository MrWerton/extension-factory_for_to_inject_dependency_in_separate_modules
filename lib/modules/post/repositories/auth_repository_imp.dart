import '../../../infra/http/client_adapter.dart';
import '../entities/post_entity.dart';
import '../repositories/auth_repository.dart';

class PostRepositoryImp extends PostRepository {
  final ClientAdapter _clientAdapter;

  PostRepositoryImp({required ClientAdapter clientAdapter})
      : _clientAdapter = clientAdapter;

  @override
  Future<List<Post>?> findAllPost() async {
    final data = await _clientAdapter.request(url: '/post', method: 'get');

    return data;
  }
}
