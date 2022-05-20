import 'package:bookworms/constants.dart';
import 'package:bookworms/services/service_injector.dart';
import 'package:bookworms/views/favourites/viewmodel/favourite_viewmodel.dart';
import 'package:bookworms/views/single_user/single_user_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FavouriteViewModel>.reactive(
        onModelReady: (model) => model.init(),
        viewModelBuilder: () => FavouriteViewModel(),
        builder: (context, model, child) => SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  centerTitle: true,
                  title: const Text('Favourite'),
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
                                      onTap: () {
                                        si.router.nextScreen(
                                            context,
                                            SingleUserView(
                                              userModel: model.data[index]!,
                                            ));
                                      },
                                      title: Text(
                                        model.data[index]?.name ??
                                            model.data[index]?.email as String,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                      trailing: const Icon(Icons.visibility,
                                          color: colorGrey));
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        const Divider(color: colorGrey),
                                itemCount: model.data.length),
                          ),
              ),
            ));
  }
}
