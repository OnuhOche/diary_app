import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:diary_app/controllers/diary_controller.dart';

class DiaryScreen extends StatelessWidget {
  DiaryScreen({Key? key}) : super(key: key);

  final DiaryController _diaryController = Get.find(tag: "diary_controller");

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(
            () => _diaryController.diaryEntries.isEmpty
            ? const Text("Welcome...")
            : ListView.separated(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(_diaryController.diaryEntries[index].dateString,
                              style: Get.textTheme.headline6),
                          const SizedBox(height: 5),
                          Text(_diaryController.diaryEntries[index].content,
                              style: Get.textTheme.headline6),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _diaryController.deleteDiaryEntry(index);
                      },
                      icon: Icon(Icons.remove_outlined, color: Get.theme.errorColor, size: 30),
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => const Divider(height: 5),
            itemCount: _diaryController.diaryEntries.length),
      ),
    );
  }
}