import 'package:bookworms/constants.dart';
import 'package:bookworms/services/book_services.dart';
import 'package:bookworms/services/service_injector.dart';
import 'package:bookworms/views/customs_widgets/pop_up.dart';
import 'package:bookworms/views/home/components/body.dart';
import 'package:bookworms/views/navigation_drawer/navigation_drawer.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BookServices().getAllBooks();
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: scaffoldbg,
        actions: [
          IconButton(
              onPressed: () async {
                si.router.nextScreen(context, const PopUp());
              },
              icon: const Icon(Icons.exit_to_app_rounded))
        ],
      ),
      drawer: const NavigationDrawer(),
      body: const Body(),
    ));
  }
}
