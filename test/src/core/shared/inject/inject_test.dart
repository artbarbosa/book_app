import 'package:book_app/src/core/book/datasources/remote/author_remote_datasource.dart';
import 'package:book_app/src/core/book/datasources/remote/book_remote_datasource.dart';
import 'package:book_app/src/core/book/repositories/author_repository.dart';
import 'package:book_app/src/core/book/repositories/book_repository.dart';
import 'package:book_app/src/core/shared/inject/inject.dart';
import 'package:book_app/src/core/shared/services/remote/graphql_http_client_impl.dart';
import 'package:book_app/src/core/shared/services/remote/http_client_service.dart';
import 'package:book_app/src/core/shared/ui/controllers/custom_bottom_navigation_bar_controller.dart';
import 'package:book_app/src/modules/home/submodules/detail/ui/controller/detail_controller.dart';
import 'package:book_app/src/modules/home/submodules/my_books/ui/controllers/my_books_controller.dart';
import 'package:book_app/src/modules/home/ui/controller/home_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:graphql/client.dart';

void main() {
  setUpAll(() async {
    await Inject.initialize();
  });

  test('Should return Instance GraphQLClient', () async {
    final result = GetIt.I<GraphQLClient>();

    expect(result, isA<GraphQLClient>());
  });
  test('Should return Instance GraphqlHttpClientServiceImp', () async {
    final result = GetIt.I<IHttpClientService>();

    expect(result, isA<IHttpClientService>());
    expect(result, isA<GraphqlHttpClientServiceImp>());
  });
  test('Should return Instance BookRemoteDataSource', () async {
    final result = GetIt.I<IBookRemoteDataSource>();

    expect(result, isA<IBookRemoteDataSource>());
    expect(result, isA<BookRemoteDataSource>());
  });
  test('Should return Instance AuthorRemoteDataSource', () async {
    final result = GetIt.I<IAuthorRemoteDataSource>();

    expect(result, isA<IAuthorRemoteDataSource>());
    expect(result, isA<AuthorRemoteDataSource>());
  });

  test('Should return Instance BookRepository', () async {
    final result = GetIt.I<IBookRepository>();

    expect(result, isA<IBookRepository>());
    expect(result, isA<BookRepository>());
  });
  test('Should return Instance AuthorRepository', () async {
    final result = GetIt.I<IAuthorRepository>();

    expect(result, isA<IAuthorRepository>());
    expect(result, isA<AuthorRepository>());
  });
  test('Should return Instance MyBooksController', () async {
    final result = GetIt.I<MyBooksController>();

    expect(result, isA<MyBooksController>());
  });
  test('Should return Instance DetailController', () async {
    final result = GetIt.I<DetailController>();

    expect(result, isA<DetailController>());
  });

  test('Should return Instance HomeController', () async {
    final result = GetIt.I<HomeController>();

    expect(result, isA<HomeController>());
  });

  test('Should return Instance CustomBottomNavigationBarController', () async {
    final result = GetIt.I<CustomBottomNavigationBarController>();

    expect(result, isA<CustomBottomNavigationBarController>());
  });
}
