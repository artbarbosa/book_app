class ApiConst {
  static const apiUrl =
      'https://us-central1-ss-devops.cloudfunctions.net/GraphQL';

  static const queryDocumentFavoriteBooks = r"""
    query FavoriteBooks {
      favoriteBooks {
        id
        name 
        author {
          name
        }
        cover
    }
  }""";

  static const queryDocumentAllBooks = r"""
    query AllBooks {
      allBooks{
  	    id
        name
        cover
        author{
          name
        }
	    }
    }""";

  static const queryDocumentFavoriteAuthors = r"""
    query FavoriteAuthors  {
      favoriteAuthors{
        id
        name
        booksCount
        picture   
      }
    }""";

  static String queryDocumentUser = r"""
    query UserPicture {
      userPicture
    }""";

  static String queryDocumentBookById(String id) => """
    query BookById {
      book(id: $id){
        cover
        isFavorite
        name
        description
        author{
          name
        }
      }
    }""";
}
