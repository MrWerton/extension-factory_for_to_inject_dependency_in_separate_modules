import '../repositories/auth_repository.dart';
import '../repositories/dto/login_params_dto.dart';

class LoginUseCase {
  final AuthRepository _authRepository;
  LoginUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;
  call({required LoginDto loginDto}) async {
    return await _authRepository.login(loginDto: loginDto);
  }
}
