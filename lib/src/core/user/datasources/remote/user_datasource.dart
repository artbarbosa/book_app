import '../../../shared/consts/api_const.dart';
import '../../../shared/failures/failures.dart';
import '../../../shared/services/remote/http_client_service.dart';
import '../../failures/user_failures.dart';

abstract class IUserRemoteDataSource {
  Future<Map<String, dynamic>> getUser();
}

class UserRemoteDataSource implements IUserRemoteDataSource {
  final IHttpClientService client;
  UserRemoteDataSource({
    required this.client,
  });

  @override
  Future<Map<String, dynamic>> getUser() async {
    try {
      final result = await client.query(ApiConst.queryDocumentUser);

      return result.data as Map<String, dynamic>;
    } on GraphqlHttpClientError {
      rethrow;
    } catch (error, stackTrace) {
      throw UserRemoteDataSourceError(
        errorMessage: error.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
