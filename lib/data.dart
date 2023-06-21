import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Datas extends ChangeNotifier {
  List<Map<String, String>> data = [
    {
      'name': 'วรดร อิสระธานันท์',
      'province': 'กรุงเทพมหานคร',
      'detail': '1/513 ซ.3ข เคหะชุมชนรามคำแหง แขวง มีนบุรี เขต มีนบุรี'
    },
    {
      'name': 'สิญาดา วาทีกานต์',
      'province': 'เชียงใหม่',
      'detail': '1/513 ซ.3ข เคหะชุมชนรามคำแหง แขวง มีนบุรี เขต มีนบุรี'
    },
    {
      'name': 'ธราธร เจียรเจริญกิจ',
      'province': 'ลพบุรี',
      'detail': '1/513 ซ.3ข เคหะชุมชนรามคำแหง แขวง มีนบุรี เขต มีนบุรี'
    },
  ];

  void addName(String value, String value2, String value3) {
    data.add({'name': value, 'province': value2, 'detail': value3});
    notifyListeners();
  }

  void deleteItem(Map task) {
    data.remove(task);
    notifyListeners();
  }

  void sortdata() {
    data.sort((a, b) {
      return a['province']!
          .toLowerCase()
          .compareTo(b['province']!.toLowerCase());
    });
  }
}
