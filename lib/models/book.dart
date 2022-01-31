class Book {
  String title;
  int? rating;
  String? author;
  String currentUser;
  Book(
      {required this.title,
      this.rating,
      this.author,
      required this.currentUser});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
        title: json['title'],
        rating: json['rating'],
        author: json['author'],
        currentUser: json['currentUser']);
  }
}
