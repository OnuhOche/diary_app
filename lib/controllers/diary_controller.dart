import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:diary_app/models/diary_entry_model.dart';
import 'package:intl/intl.dart';

class DiaryController extends GetxController {
  List<DiaryEntry> get diaryEntries => [..._diaryEntries].toList();

  final RxList<DiaryEntry> _diaryEntries = <DiaryEntry>[].obs;

  String _entryText = "";

  final GetStorage _getStorage = GetStorage();

  @override
  void onInit() {
    final List<dynamic> list = _getStorage.read("diary_entries") ?? [];

    List<DiaryEntry> data = [];

    list.forEach((element) {
      final String date = element["dateTime"];
      final String content = element["content"];

      data.add(DiaryEntry(dateString: date, content: content));
    });

    _diaryEntries.value = data;

    super.onInit();
  }

  void changeEntryText(String text) {
    _entryText = text;
  }

  void addDiaryEntry() {
    if (_entryText != "") {
      initializeDateFormatting();

      DateFormat format = DateFormat.yMMMMEEEEd(Get.locale.toString());

      String dateString = format.format(DateTime.now());

      _diaryEntries
          .add(DiaryEntry(dateString: dateString, content: _entryText));

      List data = [];

      for (DiaryEntry diaryEntry in _diaryEntries) {
        data.add({
          "dateTime": diaryEntry.dateString,
          "content": diaryEntry.content,
        });
      }

      _getStorage.write("diary_entries", data);
    }

    // Reset diary text
    _entryText = "";
  }

  void deleteDiaryEntry(int index) {
    _diaryEntries.removeAt(index);

    List data = [];

    for (DiaryEntry diaryEntry in _diaryEntries) {
      data.add({
        "dateTime": diaryEntry.dateString,
        "content": diaryEntry.content,
      });
    }

    _getStorage.write("diary_entries", data);
  }
}