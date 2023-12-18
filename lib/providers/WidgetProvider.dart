import 'package:flutter/material.dart';

class WidgetProvider extends ChangeNotifier{
  bool _isRefreshScreen = false;

  bool _isRefreshSubCategory = true;

  refreshWidget(bool refresh){
    _isRefreshScreen = refresh;
   notifyListeners();
  }
  refreshSubCategory(bool refresh){
    _isRefreshSubCategory = refresh;
    if(_isRefreshSubCategory)
   notifyListeners();
  }

  get isRefreshSubCategory => _isRefreshSubCategory;

  get isRefreshScreen => _isRefreshScreen;
}