import 'dart:core';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:toiletfinder/models/toilet.dart';

class ToiletDataProvider extends ChangeNotifier {
  static const _maxPages = 6;
  int _currentPage = 0;
  
  int selectedCategoryId = 0;
  int selectedGenderId = 0;

// Get from API
  final List<ToiletCategory> _categories = <ToiletCategory>[
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

  final List<Gender> _gender = <Gender>[
    Gender(id: 0, title: "Male"),
    Gender(id: 1, title: "Female"),
    Gender(id: 2, title: "Unisex"),
  ];

  final List<String> _titles = [
    "TOILET CATEGORY",
    "GENDER",
    "FACILITIES",
    "OTHER FACILITIES",
    "INFRASTRUCTURE",
    "RATE TOILET",
    "CONFIRM"
  ];

  String getPageTitle() {
    return _titles[_currentPage];
  }

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

  void goToNextPage() {
    if (_currentPage < _maxPages) {
      _currentPage++;
    }
  }

  void goToPreviousPage() {
    if (_currentPage > 0) {
      _currentPage--;
    }
  }

  bool isFirstPage() {
    return _currentPage == 0;
  }

  bool isLastPage() {
    return _currentPage == _maxPages;
  }

  List<ToiletCategory> getCategories() {
    return _categories;
  }

  List<Gender> getGenders() {
    return _gender;
  }
}
