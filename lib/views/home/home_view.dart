import 'dart:ui';

import 'package:bookworms/constants.dart';
import 'package:bookworms/services/book_services.dart';
import 'package:bookworms/views/customs_widgets/bottom_nav.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BookServices().getAllBooks();
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/readBooks');
                      },
                      child: const Icon(
                        Icons.menu,
                        color: colorWhite,
                        size: 30,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 32,
                        backgroundColor: colorWhite,
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/pic.jpg'),
                          backgroundColor: Colors.white,
                          radius: 30,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 60),
                Center(
                    child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                      color: colorGrey,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: const Text(
                    'You read 20 book in 2022',
                    style: TextStyle(
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
                        "You haven't set any reading goals",
                        style: TextStyle(
                            color: Colors.grey,
                            fontStyle: FontStyle.italic,
                            fontSize: 15,
                            decoration: TextDecoration.none),
                        textAlign: TextAlign.center,
                      ),
                    ))
              ],
            ),
          ),
          BottomNav(
            onpressed: () {
              Navigator.pushNamed(context, '/addView');
            },
          )
        ],
      ),
    ));
  }
}
