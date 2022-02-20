class User {
  String? name;
  String? about;
  String? state;
  String? imageUrl;

  User({this.name, this.about, this.state, this.imageUrl});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        name: json['name'],
        about: json['about'],
        state: json['state'],
        imageUrl: json['imageUrl']);
  }
  Map<String, dynamic> toJson() =>
      {'name': name, 'about': about, 'state': state};
  User copy({
    String? name,
    String? about,
    String? state,
  }) =>
      User(
          name: name ?? this.name,
          about: about ?? this.about,
          state: state ?? this.state);
}
