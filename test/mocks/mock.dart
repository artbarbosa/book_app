import 'package:book_app/src/core/book/datasources/remote/author_remote_datasource.dart';
import 'package:book_app/src/core/book/datasources/remote/book_remote_datasource.dart';
import 'package:book_app/src/core/book/model/author_model.dart';
import 'package:book_app/src/core/book/model/book_model.dart';
import 'package:book_app/src/core/book/repositories/author_repository.dart';
import 'package:book_app/src/core/book/repositories/book_repository.dart';
import 'package:book_app/src/core/shared/services/remote/http_client_service.dart';
import 'package:book_app/src/core/user/models/user_model.dart';
import 'package:book_app/src/core/user/repositories/user_repository.dart';
import 'package:graphql/client.dart';
import 'package:mocktail/mocktail.dart';

class GraphQLClientMock extends Mock implements GraphQLClient {}

class ExceptionMock extends Mock implements Exception {}

class IHttpClientServiceMock extends Mock implements IHttpClientService {}

class IBookRemoteDataSourceMock extends Mock implements IBookRemoteDataSource {}

class IBookRepositoryMock extends Mock implements IBookRepository {}

class IAuthorRepositoryMock extends Mock implements IAuthorRepository {}

class IUserRepositoryMock extends Mock implements IUserRepository {}

class IAuthorRemoteDataSourceMock extends Mock
    implements IAuthorRemoteDataSource {}

final queryOptionsMock = QueryOptions(
  document: gql(''),
);

final Map<String, dynamic> mapDataMock = {};

final QueryResult queryResultMock = QueryResult(
  source: QueryResultSource.network,
  data: mapDataMock,
  options: QueryOptions(
    document: gql(''),
  ),
);

const Map<String, dynamic> mapGetAllBooks = {
  "allBooks": [
    {
      "name": "Clean Code: A Handbook of Agile Software Craftsmanship",
      "cover": "https://sscdn.co/gcs/studiosol/2022/mobile/book/clean-code.jpg",
      "author": {"name": "Robert Cecil Martin"}
    },
    {
      "name":
          "Clean Architecture: A Craftsman's Guide to Software Structure and Design",
      "cover":
          "https://sscdn.co/gcs/studiosol/2022/mobile/book/clean-architecture.jpg",
      "author": {"name": "Robert Cecil Martin"}
    },
  ]
};
const mapGetFavoriteAuthors = {
  "favoriteAuthors": [
    {
      "name": "Robert Cecil Martin",
      "booksCount": 4,
      "picture":
          "https://sscdn.co/gcs/studiosol/2022/mobile/author/uncle-bob.jpg"
    },
    {
      "name": "J. R. R. Tolkien",
      "booksCount": 4,
      "picture":
          "https://sscdn.co/gcs/studiosol/2022/mobile/author/j-r-r-tolkien.jpg"
    },
    {
      "name": "Afonso Padilha",
      "booksCount": 1,
      "picture":
          "https://sscdn.co/gcs/studiosol/2022/mobile/author/afonso-padilha.jpg"
    }
  ]
};
const Map<String, dynamic> mapGetFavoriteBooks = {
  "favoriteBooks": [
    {
      "name": "Clean Code: A Handbook of Agile Software Craftsmanship",
      "cover": "https://sscdn.co/gcs/studiosol/2022/mobile/book/clean-code.jpg",
      "author": {"name": "Robert Cecil Martin"}
    },
    {
      "name":
          "Clean Architecture: A Craftsman's Guide to Software Structure and Design",
      "cover":
          "https://sscdn.co/gcs/studiosol/2022/mobile/book/clean-architecture.jpg",
      "author": {"name": "Robert Cecil Martin"}
    },
  ]
};

const Map<String, dynamic> mapGetBookById = {
  "book": {
    "name": "Clean Code: A Handbook of Agile Software Craftsmanship",
    "cover": "https://sscdn.co/gcs/studiosol/2022/mobile/book/clean-code.jpg",
    "isFavorite": true,
    "author": {"name": "Robert Cecil Martin"},
    "description": "Even bad code can function. "
  }
};

const Map<String, dynamic> mapGetUserPicture = {
  "userPicture": "https://sscdn.co/gcs/studiosol/2022/mobile/avatar.jpg"
};

final authorModelMock = AuthorModel(name: 'test', id: '1');

final bookModelMock = BookModel(
    cover: 'test',
    id: '1',
    author: authorModelMock,
    description: 'test',
    isFavorite: true,
    name: 'name');

final listBookModelMock = [bookModelMock];

final listAuthorModelMock = [authorModelMock];

final userModelMock = UserModel(picture: 'test');

const Map<String, dynamic> userMapMock = {
  "userPicture": "https://sscdn.co/gcs/studiosol/2022/mobile/avatar.jpg"
};
const Map<String, dynamic> bookMapMock = {
  "name": "Clean Code: A Handbook of Agile Software Craftsmanship",
  "cover": "https://sscdn.co/gcs/studiosol/2022/mobile/book/clean-code.jpg",
  "author": {"name": "Robert Cecil Martin"}
};
const Map<String, dynamic> authorMapMock = {
  "name": "Robert Cecil Martin",
  "booksCount": 4,
  "picture": "https://sscdn.co/gcs/studiosol/2022/mobile/author/uncle-bob.jpg"
};
