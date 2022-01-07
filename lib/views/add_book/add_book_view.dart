import 'dart:ui';

import 'package:bookworms/constants.dart';
import 'package:bookworms/services/service_injector.dart';
import 'package:bookworms/views/add_book/components/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class AddBookView extends StatefulWidget {
  const AddBookView({Key? key}) : super(key: key);

  @override
  State<AddBookView> createState() => _AddBookViewState();
}

class _AddBookViewState extends State<AddBookView> {
  @override
  Widget build(BuildContext context) {
    ServiceInjector si = ServiceInjector();

    TextEditingController titleController = TextEditingController();
    TextEditingController authorController = TextEditingController();
    int? rating;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Input(
                hintText: 'Title',
                controller: titleController,
              ),
              const SizedBox(height: 15),
              Input(
                hintText: 'Author (optional)',
                controller: authorController,
              ),
              const SizedBox(height: 15),
              const Text(
                'Rating',
                style: TextStyle(
                    color: colorGrey,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.all(6),
                width: 0.6 * size.width,
                decoration: BoxDecoration(
                    color: colorGrey, borderRadius: BorderRadius.circular(5)),
                child: RatingBar(
                  ratingWidget: RatingWidget(
                    empty: const Icon(Icons.star_outline),
                    half: const Icon(Icons.star_outline),
                    full: const Icon(Icons.star, color: Colors.amber),
                  ),
                  maxRating: 5,
                  minRating: 1,
                  onRatingUpdate: (e) {
                    rating = e.toInt();
                  },
                ),
              ),
              const SizedBox(height: 30),
              MaterialButton(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                onPressed: () async {
                  FocusScope.of(context).unfocus();
                  if (titleController.text != '') {
                    Map<String, dynamic> newdata = {
                      'title': titleController.text,
                      'author': authorController.text,
                      'rating': rating ?? 1
                    };
                    await si.bookServices.addBook(newdata);
                    titleController.clear();
                    authorController.clear();
                    rating = null;
                    Navigator.pop(context);
                  }
                },
                color: colorGrey,
                elevation: 12,
                textColor: colorWhite,
                child: const Text(
                  'ADD',
                  style: TextStyle(fontSize: 20),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
