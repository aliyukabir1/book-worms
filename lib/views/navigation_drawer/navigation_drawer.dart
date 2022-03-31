import 'package:bookworms/constants.dart';
import 'package:bookworms/services/service_injector.dart';
import 'package:bookworms/views/all_user/all_users_view.dart';
import 'package:bookworms/views/profile/profile_view.dart';
import 'package:bookworms/views/read_book/read_book_view.dart';

import 'package:flutter/material.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  String? imagePath;
  @override
  void initState() {
    imagePath = si.auth.getUser()!.photoURL;

    super.initState();
  }

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
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: colorGrey,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          si.router.nextScreen(context, ProfileView());
                        });
                      },
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: imagePath == null
                            ? const AssetImage('assets/pic.jpg')
                            : NetworkImage(imagePath!) as ImageProvider,
                      ),
                    ),
                  ),
                  const SizedBox(height: 7),
                  const Text(
                    "Aliyu Kabir",
                    style: TextStyle(color: colorWhite),
                  ),
                ],
              )),
          ListTile(
            onTap: () {
              si.router.nextScreen(context, const ReadBooksView());
            },
            title: const Text('See Your Books'),
            dense: true,
            tileColor: colorGrey.withOpacity(0.3),
          ),
          const Divider(
            color: colorWhite,
            height: 1,
          ),
          ListTile(
            onTap: () {
              si.router.nextScreen(context, const AllUsersview());
            },
            title: const Text("See Other User's Books"),
            dense: true,
            tileColor: colorGrey.withOpacity(0.3),
          )
        ],
      ),
    );
  }
}
