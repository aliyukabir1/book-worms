import 'package:bookworms/constants.dart';
import 'package:bookworms/services/fake_api.dart';
import 'package:flutter/material.dart';

class ReadBooksView extends StatelessWidget {
  const ReadBooksView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List data = FakeAPi().data;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Books Read'),
          backgroundColor: scaffoldbg,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    data[index]['title'],
                    style: const TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(data[index]['author'],
                      style: const TextStyle(color: colorGrey)),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        data[index]['rating'].toString(),
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
  }
}
