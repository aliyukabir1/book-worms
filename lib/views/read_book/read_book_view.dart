import 'package:bookworms/constants.dart';
import 'package:bookworms/services/service_injector.dart';
import 'package:bookworms/views/read_book/viewmodel/read_book_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ReadBooksView extends StatelessWidget {
  const ReadBooksView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ReadBookViewModel>.reactive(
        viewModelBuilder: () => ReadBookViewModel(),
        onModelReady: (model) {
          model.init();
        },
        builder: (context, model, child) => SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  centerTitle: true,
                  title: const Text('Books Read'),
                  backgroundColor: scaffoldbg,
                ),
                body: model.isBusy
                    ? const Center(child: CircularProgressIndicator())
                    : model.hasError
                        ? si.util.showErrorText(
                            'oops,something went wrong!!! please check your internet connections')
                        : Padding(
                            padding: const EdgeInsets.all(20),
                            child: ListView.separated(
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text(
                                      model.data![index].title,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    subtitle: Text(model.data![index].author,
                                        style:
                                            const TextStyle(color: colorGrey)),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          model.data![index].rating.toString(),
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        const SizedBox(width: 5),
                                        const Icon(Icons.star,
                                            color: Colors.amber)
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        const Divider(color: colorGrey),
                                itemCount: model.data!.length),
                          ),
              ),
            ));
  }
}
