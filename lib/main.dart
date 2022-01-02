import 'package:bookworms/constants.dart';
import 'package:bookworms/views/add_book/add_book_view.dart';
import 'package:bookworms/views/home/home_view.dart';
import 'package:bookworms/views/read_book/read_book_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: scaffoldbg,
      ),
      home: const Home(),
      routes: <String, WidgetBuilder>{
        '/addView': (BuildContext context) => const AddBookView(),
        '/readBooks': (BuildContext context) => const ReadBooksView(),
      },
    );
  }
}
