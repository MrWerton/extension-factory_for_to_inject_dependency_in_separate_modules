import '../../../infra/http/client_adapter.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';
import '../repositories/dto/login_params_dto.dart';

class AuthRepositoryImp extends AuthRepository {
  final ClientAdapter _clientAdapter;

  AuthRepositoryImp({required ClientAdapter clientAdapter})
      : _clientAdapter = clientAdapter;

  @override
  Future<User?> login({required LoginDto loginDto}) async {
    print(loginDto.toMap());
  }
}
