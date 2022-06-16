class UserModel {
  String picture;
  UserModel({
    required this.picture,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      picture: map['userPicture'] ?? '',
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel && other.picture == picture;
  }

  @override
  int get hashCode => picture.hashCode;
}
