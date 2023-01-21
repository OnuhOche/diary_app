import 'package:get/get.dart';

class Locales extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    "en_US" : {
      "change_username" : "Change Username",
      "diary": "Diary",
      "add": "Add"
    },
    "fr_FR" : {
      "change_username" : "changer nom d'utilisateur",
      "diary": "Agenda",
      "add": "Ajouter"
    },
    "esp_ESP" : {
      "change_username" : "Cambie el nombre de usuario",
      "diary" : "Diario",
      "add": "Agregar"
    },
  };
}