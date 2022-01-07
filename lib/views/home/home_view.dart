import 'package:bookworms/services/book_services.dart';
import 'package:bookworms/views/home/components/body.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BookServices().getAllBooks();
    return const SafeArea(
        child: Scaffold(
      body: Body(),
    ));
  }
}
