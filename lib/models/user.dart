class UserModel {
  String? name;
  String? about;
  String? state;
  String? imageUrl;
  String? email;
  String? uid;
  List<String?>? friends;

  UserModel(
      {this.name,
      this.about,
      this.state,
      this.imageUrl,
      this.email,
      this.uid,
      this.friends});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        name: json['name'],
        about: json['about'],
        state: json['state'],
        imageUrl: json['imageUrl'],
        email: json['email'],
        friends: json['friends'],
        uid: json['uid']);
  }
  Map<String, dynamic> toJson() => {
        'name': name,
        'about': about,
        'state': state,
      };
  UserModel copy({
    String? name,
    String? about,
    String? state,
  }) =>
      UserModel(
        name: name ?? this.name,
        about: about ?? this.about,
        state: state ?? this.state,
      );
}
