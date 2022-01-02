class Book {
  String title;
  double rating;
  double? author;
  Book({required this.title, required this.rating, this.author});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
        title: json['title'], rating: json['rating'], author: json['author']);
  }
}
