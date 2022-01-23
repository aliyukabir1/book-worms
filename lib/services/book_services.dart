import 'package:bookworms/models/book.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BookServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<dynamic> getAllBooks() async {
    List<Book> bookList = [];
    try {
      await firestore.collection('books').get().then((value) {
        List<QueryDocumentSnapshot<Map<String, dynamic>>> books = value.docs;
        for (var book in books) {
          bookList.add(Book(
              title: book.data()['title'],
              rating: book.data()['rating'],
              author: book.data()['author']));
        }
      });
      return bookList;
    } catch (e) {
      return null;
    }
  }

  Future addBook(Map<String, dynamic> data) async {
    await firestore.collection('books').add(data).then((value) {});
  }

  Future signUp(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      return null;
    }
  }

  Future signIn(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      return null;
    }
  }
}
