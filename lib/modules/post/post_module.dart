import 'package:provider/provider.dart';
import '../../factories/module_factory/module_factory.dart';

import './controllers/get_post_controller.dart';
import './facade/post_controller_facade.dart';
import './pages/post_page.dart';
import './repositories/auth_repository.dart';
import './repositories/auth_repository_imp.dart';

class PostModule extends ModuleFactory {
  @override
  Routers get routers => {
        '/post': (context, __) =>
            PostPage(postControllerFacade: context.watch()),
      };
  @override
  Bind? get bindings => [
        Provider<PostRepository>(
            create: (context) =>
                PostRepositoryImp(clientAdapter: context.read())),
        Provider(
          create: (context) =>
              GetPostController(postRepository: context.read()),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              PostControllerFacade(getPostController: context.read()),
        ),
      ];
}
