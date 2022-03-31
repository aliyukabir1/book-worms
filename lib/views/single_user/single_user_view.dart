import 'package:bookworms/constants.dart';
import 'package:bookworms/models/user.dart';
import 'package:bookworms/views/single_user/viewmodel/single_user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SingleUserView extends StatelessWidget {
  final UserModel userModel;
  const SingleUserView({Key? key, required this.userModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SingleUserViewModel>.reactive(
        viewModelBuilder: () => SingleUserViewModel(),
        onModelReady: (model) {
          model.init(userModel);
        },
        builder: (context, model, child) => SafeArea(
                child: Scaffold(
              appBar: AppBar(
                title: Text(userModel.name ?? ''),
                actions: [
                  Container(
                    decoration: BoxDecoration(
                        color: model.like
                            ? colorWhite
                            : colorWhite.withOpacity(0.5),
                        shape: BoxShape.circle),
                    child: IconButton(
                      onPressed: () {
                        model.toggleLike();
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: model.like ? Colors.red : null,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  )
                ],
                centerTitle: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              body: Column(
                children: [
                  const Center(
                    child: Text(
                      'Books Read by Hashim',
                      style: TextStyle(color: colorGrey, fontSize: 15),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: const Text(
                                'redad',
                                style: TextStyle(color: Colors.white),
                              ),
                              subtitle: const Text('author',
                                  style: TextStyle(color: colorGrey)),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    index.toString(),
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
                          itemCount: 7),
                    ),
                  ),
                ],
              ),
            )));
  }
}
