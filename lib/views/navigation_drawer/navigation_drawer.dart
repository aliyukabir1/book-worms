import 'package:bookworms/constants.dart';
import 'package:bookworms/services/service_injector.dart';
import 'package:bookworms/views/read_book/read_book_view.dart';
import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DrawerHeader(
              decoration: const BoxDecoration(color: scaffoldbg),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: colorGrey,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/pic.jpg'),
                    ),
                  ),
                  SizedBox(height: 7),
                  Text(
                    "Aliyu Kabir",
                    style: TextStyle(color: colorWhite),
                  ),
                ],
              )),
          ListTile(
            onTap: () {
              si.router.nextScreen(context, const ReadBooksView());
            },
            title: const Text('See All Books'),
            dense: true,
            tileColor: colorGrey.withOpacity(0.3),
          ),
          const Divider(
            color: colorWhite,
            height: 1,
          ),
          ListTile(
            title: const Text('Data'),
            dense: true,
            tileColor: colorGrey.withOpacity(0.3),
          )
        ],
      ),
    );
  }
}
