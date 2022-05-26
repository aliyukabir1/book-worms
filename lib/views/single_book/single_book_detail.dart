import 'package:bookworms/constants.dart';
import 'package:flutter/material.dart';

class SingleBookDetail extends StatelessWidget {
  final String title;
  final String? author;
  final int rating;
  final String? shortNote;
  const SingleBookDetail(
      {Key? key,
      required this.title,
      this.author,
      required this.rating,
      this.shortNote})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isShortNoteEmpty = shortNote == null ? true : false;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 30),
              const Center(
                child: Text(
                  'The Crimes Of Grindelwald',
                  style: TextStyle(color: colorWhite, fontSize: 20),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Author :',
                      style: TextStyle(color: colorGrey, fontSize: 20)),
                  const SizedBox(width: 20),
                  Text(author ?? '___',
                      style: const TextStyle(color: colorGrey, fontSize: 20)),
                  const SizedBox(width: 5),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Rating :',
                      style: TextStyle(color: colorGrey, fontSize: 20)),
                  const SizedBox(width: 20),
                  Text(rating.toString(),
                      style: const TextStyle(color: colorGrey, fontSize: 20)),
                  const SizedBox(width: 5),
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  height: 400,
                  color: Colors.white,
                  child: SingleChildScrollView(
                    child: Text(
                      shortNote ?? 'No notes left',
                      textAlign:
                          isShortNoteEmpty ? TextAlign.center : TextAlign.start,
                      style: TextStyle(
                          fontSize: 20,
                          height: 1.5,
                          color: isShortNoteEmpty
                              ? Colors.grey
                              : const Color.fromARGB(221, 37, 37, 37),
                          fontStyle: isShortNoteEmpty
                              ? FontStyle.italic
                              : FontStyle.normal),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
