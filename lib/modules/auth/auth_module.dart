import 'package:provider/provider.dart';
import '../../factories/module_factory/module_factory.dart';
import 'facades/auth_controller_facade.dart';
import './repositories/auth_repository.dart';
import './usecases/login_usecase.dart';
import './pages/create_account_page.dart';
import './pages/login_page.dart';
import './repositories/auth_repository_imp.dart';

class AuthModule extends ModuleFactory {
  @override
  Routers get routers => {
        '/login': (context, __) =>
            LoginPage(authControllerFacade: context.watch()),
        '/create-account': (context, __) =>
            CreateAccountPage(authControllerFacade: context.watch()),
      };
  @override
  Bind? get bindings => [
        Provider<AuthRepository>(
          create: (context) => AuthRepositoryImp(clientAdapter: context.read()),
        ),
        Provider(
          create: (context) => LoginUseCase(authRepository: context.read()),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              AuthControllerFacade(loginUseCase: context.read()),
        )
      ];
}
