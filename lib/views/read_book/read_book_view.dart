import 'package:bookworms/constants.dart';
import 'package:bookworms/services/service_injector.dart';
import 'package:flutter/material.dart';

class ReadBooksView extends StatelessWidget {
  ReadBooksView({Key? key}) : super(key: key);
  final ServiceInjector si = ServiceInjector();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
        future: si.bookServices.getAllBooks(),
        builder: (context, snapshot) {
          final data = snapshot.data;
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const Text('Books Read'),
                backgroundColor: scaffoldbg,
              ),
              body: snapshot.connectionState == ConnectionState.waiting
                  ? const Center(child: CircularProgressIndicator())
                  : Padding(
                      padding: const EdgeInsets.all(20),
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(
                                data[index].title,
                                style: const TextStyle(color: Colors.white),
                              ),
                              subtitle: Text(data[index].author,
                                  style: const TextStyle(color: colorGrey)),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    data[index].rating.toString(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  const SizedBox(width: 5),
                                  const Icon(Icons.star, color: Colors.amber)
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(color: colorGrey),
                          itemCount: data.length),
                    ),
            ),
          );
        });
  }
}
