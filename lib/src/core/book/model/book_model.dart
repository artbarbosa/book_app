import 'author_model.dart';

class BookModel {
  final String id;
  final String cover;
  final String? name;
  final AuthorModel? author;
  final String? description;
  final bool? isFavorite;
  BookModel({
    required this.id,
    this.name,
    this.author,
    required this.cover,
    this.description,
    this.isFavorite,
  });

  factory BookModel.fromMap(Map<String, dynamic> map) {
    return BookModel(
      id: map['id'] ?? '',
      name: map['name'],
      author: map['author'] != null ? AuthorModel.fromMap(map['author']) : null,
      cover: map['cover'] ?? '',
      description: map['description'],
      isFavorite: map['isFavorite'],
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BookModel &&
        other.id == id &&
        other.name == name &&
        other.author == author &&
        other.cover == cover &&
        other.description == description &&
        other.isFavorite == isFavorite;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        author.hashCode ^
        cover.hashCode ^
        description.hashCode ^
        isFavorite.hashCode;
  }
}
