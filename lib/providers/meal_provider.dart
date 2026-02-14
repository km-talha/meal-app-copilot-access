import 'package:flutter/material.dart';

class MealProvider with ChangeNotifier {
  List<String> _selectedMeals = [];
  List<String> _mealHistory = [];
  bool _isMealSelected = false;

  List<String> get selectedMeals => _selectedMeals;
  List<String> get mealHistory => _mealHistory;
  bool get isMealSelected => _isMealSelected;

  void selectMeal(String meal) {
    _selectedMeals.add(meal);
    _isMealSelected = true;
    notifyListeners();
  }

  void cancelMeal(String meal) {
    _selectedMeals.remove(meal);
    if (_selectedMeals.isEmpty) {
      _isMealSelected = false;
    }
    notifyListeners();
  }

  void addToHistory(String meal) {
    _mealHistory.add(meal);
    notifyListeners();
  }

  void clearHistory() {
    _mealHistory.clear();
    notifyListeners();
  }
}