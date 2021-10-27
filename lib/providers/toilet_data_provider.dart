import 'dart:core';

import 'package:flutter/material.dart';
import 'package:toiletfinder/models/toilet.dart';

class ToiletDataProvider extends ChangeNotifier {
  
  int selectedCategoryId = 0;
  int selectedGenderId = 0;

// Get from API
  List<ToiletCategory> categories = <ToiletCategory>[
    ToiletCategory(id: 0, title: "Hotel/Restaurant"),
    ToiletCategory(id: 1, title: "E-Toilet"),
    ToiletCategory(id: 2, title: "Health"),
    ToiletCategory(id: 3, title: "Market"),
    ToiletCategory(id: 4, title: "Transit"),
    ToiletCategory(id: 5, title: "Religious"),
    ToiletCategory(id: 6, title: "Public"),
    ToiletCategory(id: 7, title: "Recreational"),
    ToiletCategory(id: 8, title: "Other Institution"),
  ];

  List<Gender> gender = <Gender>[
    Gender(id: 0, title: "Male"),
    Gender(id: 1, title: "Female"),
    Gender(id: 2, title: "Unisex"),
  ];

  void selectCategory(int? categoryId) {
    if (categoryId != null) {
      selectedCategoryId = categoryId;
      notifyListeners();
    }
  }

  void selectGender(int genderId) {
    selectedGenderId = genderId;
    notifyListeners();
  }
}
