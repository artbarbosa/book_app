import '../../../shared/consts/api_const.dart';
import '../../../shared/failures/failures.dart';
import '../../../shared/services/remote/http_client_service.dart';
import '../../failures/author_failures.dart';

abstract class IAuthorRemoteDataSource {
  Future<Map<String, dynamic>> getfavoriteAuthors();
}

class AuthorRemoteDataSource implements IAuthorRemoteDataSource {
  final IHttpClientService client;
  AuthorRemoteDataSource({
    required this.client,
  });

  @override
  Future<Map<String, dynamic>> getfavoriteAuthors() async {
    try {
      final result = await client.query(ApiConst.queryDocumentFavoriteAuthors);

      return result.data as Map<String, dynamic>;
    } on GraphqlHttpClientError {
      rethrow;
    } catch (error, stackTrace) {
      throw AuthorRemoteDataSourceError(
        errorMessage: error.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
