import 'package:bookworms/constants.dart';
import 'package:bookworms/views/customs_widgets/button.dart';
import 'package:bookworms/views/profile/components/info_input.dart';
import 'package:bookworms/views/profile/viewmodel/profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ProfileView extends StatelessWidget {
  ProfileView({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController? nameController = TextEditingController();
    TextEditingController? stateController = TextEditingController();
    TextEditingController? aboutController = TextEditingController();

    return ViewModelBuilder<ProfileViewModel>.reactive(
        viewModelBuilder: () => ProfileViewModel(),
        onModelReady: (model) {
          model.init();
          nameController.text = model.name ?? '';
          aboutController.text = model.about ?? '';
          stateController.text = model.state ?? '';
        },
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const Text('Profile'),
                backgroundColor: scaffoldbg,
                elevation: 0,
              ),
              body: model.isBusy
                  ? const Center(
                      child: CircularProgressIndicator(color: colorGrey))
                  : SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            Center(
                              child: Stack(
                                children: [
                                  CircleAvatar(
                                    key: ValueKey(model.imageKey),
                                    radius: 57,
                                    backgroundColor: colorWhite,
                                    child: CircleAvatar(
                                      backgroundImage: model.imagePath == null
                                          ? const AssetImage('assets/pic.jpg')
                                          : NetworkImage(model.imagePath!)
                                              as ImageProvider,
                                      radius: 55,
                                    ),
                                  ),
                                  model.isEdit
                                      ? Positioned(
                                          bottom: 0,
                                          right: 0,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            child: IconButton(
                                              onPressed: () {
                                                model.uploadImage();
                                              },
                                              icon: const Icon(
                                                  Icons.camera_alt_outlined),
                                              color: colorWhite,
                                            ),
                                          ),
                                        )
                                      : const SizedBox()
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              model.user!.name ?? '',
                              style: const TextStyle(
                                  color: colorWhite, fontSize: 20),
                            ),
                            const SizedBox(height: 10),
                            CustomButton(
                              title: model.isEdit
                                  ? 'Save Profile'
                                  : 'Edit  Profile',
                              function: () async {
                                if (model.isEdit) {
                                  var data = model.user!.copy(
                                      name: nameController.text,
                                      about: aboutController.text,
                                      state: stateController.text);
                                  await model.updateProfile(data);
                                  model.toggleEdit();
                                }
                                model.toggleEdit();
                              },
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              "Information",
                              style: TextStyle(color: colorWhite, fontSize: 20),
                            ),
                            const SizedBox(height: 20),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: colorGrey.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    InfoInput(
                                      controller: nameController
                                        ..text = model.name ?? '',
                                      prefixText: 'Name : ',
                                      hintText: 'What is your Name?',
                                      icon: Icons.person,
                                      readOnly: model.isEdit,
                                    ),
                                    const Divider(color: scaffoldbg),
                                    InfoInput(
                                        controller: stateController
                                          ..text = model.state ?? '',
                                        prefixText: 'State : ',
                                        hintText: 'Which state are you from ?',
                                        readOnly: model.isEdit,
                                        icon: Icons.location_city),
                                    const Divider(color: scaffoldbg),
                                    InfoInput(
                                      controller: aboutController
                                        ..text = model.about ?? '',
                                      maxline: 3,
                                      prefixText: 'Bio : ',
                                      hintText: 'say something about you',
                                      icon: Icons.mode_edit_outline_sharp,
                                      readOnly: model.isEdit,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
            ));
  }
}
