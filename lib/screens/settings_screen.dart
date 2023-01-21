import 'package:diary_app/controllers/user_controller.dart';
import 'package:diary_app/screens/change_username_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
   SettingsScreen({Key? key}) : super(key: key);

   final UserController _userController = Get.put(UserController(), tag: "user_controller");

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
          const SizedBox(height: 10),
          //This is an observer reactive widget in GetX
          // automatically rebuilds when observable (username) changes
          Obx(() => Text(_userController.username, style: Get.textTheme.headline5)),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: () { Get.updateLocale(const Locale("fr_FR"));}, child: const Text("FR")),
            ElevatedButton(onPressed: () {Get.updateLocale(const Locale("esp_ESP"));}, child: const Text("ESP")),
            ElevatedButton(onPressed: () {Get.updateLocale(const Locale("en_US"));}, child: const Text("EN")),
          ],
        ),
        const SizedBox(height: 10),
        ElevatedButton(
            onPressed: () {
              Get.to(()=> const ChangeUsernameScreen());
            },
            child: Text("Change Username".tr)),
      ]),
    );
  }
}
