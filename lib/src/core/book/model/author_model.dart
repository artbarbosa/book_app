class AuthorModel {
  final String name;
  final String? id;
  final int? booksCount;
  final String? picture;
  AuthorModel({
    required this.name,
    required this.id,
    this.booksCount,
    this.picture,
  });

  factory AuthorModel.fromMap(Map<String, dynamic> map) {
    return AuthorModel(
      name: map['name'] ?? '',
      id: map['id'],
      booksCount: map['booksCount'],
      picture: map['picture'],
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthorModel &&
        other.name == name &&
        other.id == id &&
        other.booksCount == booksCount &&
        other.picture == picture;
  }

  @override
  int get hashCode {
    return name.hashCode ^ id.hashCode ^ booksCount.hashCode ^ picture.hashCode;
  }
}
