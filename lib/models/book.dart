class Book {
  String title;
  int? rating;
  String? author;
  Book({required this.title, this.rating, this.author});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
        title: json['title'], rating: json['rating'], author: json['author']);
  }
}
