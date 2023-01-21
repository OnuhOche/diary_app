import 'package:flutter/material.dart';
import 'package:diary_app/controllers/diary_controller.dart';
import 'package:diary_app/screens/diary_screen.dart';
import 'package:diary_app/screens/settings_screen.dart';
import 'package:get/get.dart';

class DiaryTabBarView extends StatefulWidget {
  const DiaryTabBarView({Key? key}) : super(key: key);

  @override
  _DiaryTabBarViewState createState() => _DiaryTabBarViewState();
}

class _DiaryTabBarViewState extends State<DiaryTabBarView> {

  final DiaryController _diaryController = Get.put(DiaryController(), tag: "diary_controller");

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Diary".tr, style: const TextStyle(color: Colors.white)),
            actions: [
              IconButton(
                  onPressed: () {
                    Get.bottomSheet(BottomSheet(
                      enableDrag: false,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      builder: (context) {
                        return Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextField(
                                onChanged: (value) {
                                  _diaryController.changeEntryText(value);
                                },
                              ),
                              const SizedBox(height: 8),
                              ElevatedButton(
                                  onPressed: () {
                                    _diaryController.addDiaryEntry();
                                    // Closes BottomSheet
                                    Get.back();
                                  },
                                  child: Text("add".tr))
                            ],
                          ),
                        );
                      },
                      onClosing: () {},
                    ));

                    //TODO:- Show bottom sheet
                  },
                  icon: const Icon(Icons.add, color: Colors.white, size: 30))
            ],
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.event_note)),
                Tab(icon: Icon(Icons.settings)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              DiaryScreen(),
              SettingsScreen(),
            ],
          ),
        ));
  }
}