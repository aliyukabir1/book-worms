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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //controllers
  TextEditingController titleController = TextEditingController();
  TextEditingController authorController = TextEditingController();
  TextEditingController shortNoteController = TextEditingController();
  int? rating;

//clears all the input fields
  void clearAllInput() {
    titleController.clear();
    authorController.clear();
    shortNoteController.clear();
    rating = null;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a book'),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
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
                        color: colorGrey,
                        borderRadius: BorderRadius.circular(5)),
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
                  Input(
                    hintText: 'short note',
                    controller: shortNoteController,
                    maxLines: 8,
                  ),
                  const SizedBox(height: 30),
                  MaterialButton(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    onPressed: () async {
                      FocusScope.of(context).unfocus();
                      if (titleController.text != '') {
                        Map<String, dynamic> newdata = {
                          'title': titleController.text,
                          'author': authorController.text,
                          'rating': rating ?? 1,
                          'currentUser': si.auth.getCurrentUser(),
                          'shortNote': shortNoteController.text
                        };
                        si.bookServices.addBook(newdata).then(
                              (value) => si.util
                                  .showToast(context, 'book add successfully'),
                            );
                        clearAllInput();
                        rating = 0;

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
        ),
      ),
    );
  }
}
