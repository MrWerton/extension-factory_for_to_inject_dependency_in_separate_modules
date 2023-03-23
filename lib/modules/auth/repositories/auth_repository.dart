import '../entities/user_entity.dart';
import '../repositories/dto/login_params_dto.dart';

abstract class AuthRepository {
  Future<User?> login({required LoginDto loginDto});
}
