import '../../shared/failures/failures.dart';
import '../datasources/remote/author_remote_datasource.dart';
import '../failures/author_failures.dart';
import '../model/author_model.dart';

abstract class IAuthorRepository {
  Future<List<AuthorModel>> getFavoriteAuthorsBooks();
}

class AuthorRepository implements IAuthorRepository {
  final IAuthorRemoteDataSource datasource;

  AuthorRepository({required this.datasource});

  @override
  Future<List<AuthorModel>> getFavoriteAuthorsBooks() async {
    try {
      final result = await datasource.getfavoriteAuthors();
      final list = result['favoriteAuthors'] as List;
      return list.map((e) => AuthorModel.fromMap(e)).toList();
    } on GraphqlHttpClientError {
      rethrow;
    } on AuthorRemoteDataSourceError {
      rethrow;
    } catch (error, stackTrace) {
      throw AuthorRepositoryError(
        errorMessage: error.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
