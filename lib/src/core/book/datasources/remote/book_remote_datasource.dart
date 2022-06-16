import '../../../shared/consts/api_const.dart';
import '../../../shared/failures/failures.dart';
import '../../../shared/services/remote/http_client_service.dart';
import '../../failures/book_failures.dart';

abstract class IBookRemoteDataSource {
  Future<Map<String, dynamic>> getAllBooks();
  Future<Map<String, dynamic>> getFavoriteBooks();
  Future<Map<String, dynamic>> getBookById(String id);
}

class BookRemoteDataSource implements IBookRemoteDataSource {
  final IHttpClientService client;

  BookRemoteDataSource({
    required this.client,
  });

  @override
  Future<Map<String, dynamic>> getAllBooks() async {
    try {
      final result = await client.query(ApiConst.queryDocumentAllBooks);

      return result.data as Map<String, dynamic>;
    } on GraphqlHttpClientError {
      rethrow;
    } catch (error, stackTrace) {
      throw BookRemoteDataSourceError(
        errorMessage: error.toString(),
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<Map<String, dynamic>> getBookById(String id) async {
    try {
      final result = await client.query(ApiConst.queryDocumentBookById(id));

      return result.data as Map<String, dynamic>;
    } on GraphqlHttpClientError {
      rethrow;
    } catch (error, stackTrace) {
      throw BookRemoteDataSourceError(
        errorMessage: error.toString(),
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<Map<String, dynamic>> getFavoriteBooks() async {
    try {
      final result = await client.query(ApiConst.queryDocumentFavoriteBooks);

      return result.data as Map<String, dynamic>;
    } on GraphqlHttpClientError {
      rethrow;
    } catch (error, stackTrace) {
      throw BookRemoteDataSourceError(
        errorMessage: error.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
