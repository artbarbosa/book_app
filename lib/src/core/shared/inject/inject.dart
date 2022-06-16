import 'package:get_it/get_it.dart';
import 'package:graphql/client.dart';

import '../../../modules/home/submodules/detail/ui/controller/detail_controller.dart';
import '../../../modules/home/submodules/my_books/ui/controllers/my_books_controller.dart';
import '../../../modules/home/ui/controller/home_controller.dart';
import '../../book/datasources/remote/author_remote_datasource.dart';
import '../../book/datasources/remote/book_remote_datasource.dart';
import '../../book/repositories/author_repository.dart';
import '../../book/repositories/book_repository.dart';
import '../../user/datasources/remote/user_datasource.dart';
import '../../user/repositories/user_repository.dart';
import '../consts/api_const.dart';
import '../services/remote/graphql_http_client_impl.dart';
import '../services/remote/http_client_service.dart';
import '../ui/controllers/custom_bottom_navigation_bar_controller.dart';

class Inject {
  static initialize() {
    GetIt getIt = GetIt.I;

    getIt.registerLazySingleton<GraphQLClient>(
      () => GraphQLClient(
        link: HttpLink(ApiConst.apiUrl),
        cache: GraphQLCache(),
      ),
    );

    getIt.registerLazySingleton<IHttpClientService>(
        () => GraphqlHttpClientServiceImp(getIt()));

    getIt.registerLazySingleton<IBookRemoteDataSource>(
        () => BookRemoteDataSource(client: getIt()));

    getIt.registerLazySingleton<IAuthorRemoteDataSource>(
        () => AuthorRemoteDataSource(client: getIt()));

    getIt.registerLazySingleton<IUserRemoteDataSource>(
        () => UserRemoteDataSource(client: getIt()));

    getIt.registerLazySingleton<IBookRepository>(
        () => BookRepository(datasource: getIt()));

    getIt.registerLazySingleton<IAuthorRepository>(
        () => AuthorRepository(datasource: getIt()));

    getIt.registerLazySingleton<IUserRepository>(
        () => UserRepository(datasource: getIt()));

    getIt.registerLazySingleton<MyBooksController>(
      () => MyBooksController(getIt(), getIt()),
    );

    getIt.registerFactory<DetailController>(
      () => DetailController(getIt()),
    );

    getIt.registerFactory<HomeController>(
      () => HomeController(getIt()),
    );

    getIt.registerLazySingleton<CustomBottomNavigationBarController>(
      () => CustomBottomNavigationBarController(0),
    );
  }
}
