import '../../shared/failures/failures.dart';
import '../datasources/remote/user_datasource.dart';
import '../failures/user_failures.dart';
import '../models/user_model.dart';

abstract class IUserRepository {
  Future<UserModel> getUser();
}

class UserRepository implements IUserRepository {
  final IUserRemoteDataSource datasource;

  UserRepository({required this.datasource});

  @override
  Future<UserModel> getUser() async {
    try {
      final result = await datasource.getUser();
      return UserModel(picture: result['userPicture']);
    } on GraphqlHttpClientError {
      rethrow;
    } on UserRemoteDataSourceError {
      rethrow;
    } catch (error, stackTrace) {
      throw UserRepositoryError(
        errorMessage: error.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
