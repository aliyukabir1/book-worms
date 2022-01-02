import 'dart:ui';

import 'package:bookworms/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class AddBookView extends StatelessWidget {
  const AddBookView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double? rating;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Input(hintText: 'Title'),
              const SizedBox(height: 15),
              const Input(hintText: 'Author (optional)'),
              const SizedBox(height: 15),
              const Text('Rating',
                  style: TextStyle(
                    color: colorGrey,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  )),
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
                    rating = e;
                  },
                ),
              ),
              const SizedBox(height: 50),
              MaterialButton(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                onPressed: () {
                  Map<String, dynamic> newdata = {
                    'name': 'naem',
                    'title': 'title',
                    'rating': rating
                  };
                  // print(newdata);
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

class Input extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;

  const Input({Key? key, this.controller, required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        controller: controller,
        textCapitalization: TextCapitalization.words,
        cursorColor: colorWhite,
        style: const TextStyle(color: colorWhite, fontSize: 20),
        decoration: InputDecoration(
            focusedBorder: InputBorder.none,
            hintText: hintText,
            fillColor: colorGrey,
            filled: true,
            focusColor: Colors.grey),
      ),
    );
  }
}
