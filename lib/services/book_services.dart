import 'package:firebase_storage/firebase_storage.dart';
import 'package:bookworms/models/book.dart';
import 'package:bookworms/services/service_injector.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BookServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;

//get all books
  Future<dynamic> getAllBooks() async {
    List<Book> bookList = [];
    try {
      await firestore
          .collection('books')
          .where('currentUser', isEqualTo: si.auth.getCurrentUser())
          .get()
          .then((value) {
        List<QueryDocumentSnapshot<Map<String, dynamic>>> books = value.docs;
        for (var book in books) {
          bookList.add(Book(
              title: book.data()['title'],
              rating: book.data()['rating'],
              author: book.data()['author'],
              currentUser: book.data()['currentUser']));
        }
      });

      return bookList;
    } catch (e) {
      rethrow;
    }
  }

//add a book to your collection
  Future addBook(Map<String, dynamic> data) async {
    try {
      await firestore.collection('books').add(data).then((value) {});
    } catch (e) {
      rethrow;
    }
  }
}
