import 'package:bookworms/constants.dart';
import 'package:bookworms/services/local_storage.dart';
import 'package:bookworms/services/service_injector.dart';
import 'package:bookworms/views/add_book/add_book_view.dart';
import 'package:bookworms/views/customs_widgets/bottom_nav.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: LocalStorage().getNumberOfBooksRead(),
        builder: (context, snapshot) {
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Center(
                        child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                          color: colorGrey,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Text(
                        'You read ${snapshot.data} book so far',
                        style: const TextStyle(
                            fontSize: 20,
                            color: colorWhite,
                            decoration: TextDecoration.none),
                      ),
                    )),
                    const SizedBox(height: 70),
                    Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                            color: colorGrey,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                  color: colorWhite,
                                  blurRadius: 11,
                                  spreadRadius: 4,
                                  offset: Offset(1, 1))
                            ]),
                        child: const Center(
                          child: Text(
                            "Readers are Leaders",
                            style: TextStyle(
                                color: Colors.grey,
                                fontStyle: FontStyle.italic,
                                fontSize: 18,
                                decoration: TextDecoration.none),
                            textAlign: TextAlign.center,
                          ),
                        ))
                  ],
                ),
              ),
              BottomNav(
                onpressed: () {
                  si.router.nextScreen(context, const AddBookView());
                },
              )
            ],
          );
        });
  }
}
