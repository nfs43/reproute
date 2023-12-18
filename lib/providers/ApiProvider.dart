import 'package:flutter/widgets.dart';

class ApiProvider extends ChangeNotifier{
  bool _isLoading = false;

  showLoader(isLoading){
    _isLoading = isLoading;
    notifyListeners();
  }

  bool isLoaderVisible() => _isLoading;
}