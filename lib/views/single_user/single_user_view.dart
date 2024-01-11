import 'package:bookworms/constants.dart';
import 'package:bookworms/models/user.dart';
import 'package:bookworms/services/service_injector.dart';
import 'package:bookworms/views/single_user/viewmodel/single_user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SingleUserView extends StatelessWidget {
  final bool isFriendPage;
  final UserModel userModel;
  const SingleUserView(
      {Key? key, required this.userModel, this.isFriendPage = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SingleUserViewModel>.reactive(
        viewModelBuilder: () => SingleUserViewModel(),
        onViewModelReady: (model) {
          model.init(userModel);
        },
        builder: (context, model, child) => SafeArea(
                child: Scaffold(
              appBar: AppBar(
                title: Text(userModel.name ?? ''),
                actions: [
                  Container(
                    decoration: const BoxDecoration(
                        color: colorWhite, shape: BoxShape.circle),
                    child: IconButton(
                      onPressed: () async {
                        isFriendPage
                            ? await model.removeFriend(userModel.uid ?? '')
                            : await model.addFriend(userModel.uid ?? '');

                        // ignore: use_build_context_synchronously
                        si.util.showToast(
                            context,
                            isFriendPage
                                ? '${userModel.name ?? userModel.email} has been removed from your friends list.'
                                : '${userModel.name ?? userModel.email} has been added to your friends list.');
                      },
                      icon: Icon(isFriendPage ? Icons.remove : Icons.add,
                          color: Colors.red),
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
                  Center(
                    child: Text(
                      'Books Read by ${userModel.name}',
                      style: const TextStyle(color: colorGrey, fontSize: 15),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(
                                model.booksList[index]!.title,
                                style: const TextStyle(color: Colors.white),
                              ),
                              subtitle: Text(
                                  model.booksList[index]!.author ?? '',
                                  style: const TextStyle(color: colorGrey)),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    model.booksList[index]!.rating.toString(),
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
                          itemCount: model.booksList.length),
                    ),
                  ),
                ],
              ),
            )));
  }
}
