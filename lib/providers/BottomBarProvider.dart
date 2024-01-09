// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:rep_route/screens/dashboard.dart';
import 'package:rep_route/screens/root/widgets/Bnb/BottomBarTab.dart';

class BottomBarProvider extends ChangeNotifier {
  int _currentTab = 0;
  Widget _screen = Dashboard();
  bool _hide = false;

  final List<Widget> screens = [
    Dashboard(),
    Dashboard(),
    Dashboard(),
  ];

  final List<MyTabItem> _bottombaritems = [
    MyTabItem('Search', 'assets/icons/map_search.svg'),
    MyTabItem('Chat', 'assets/icons/chat.svg'),
    MyTabItem('Calendar', 'assets/icons/calendar.svg'),
  ];

  get getbottombaritems => _bottombaritems;

  set screen(screen) {
    _screen = screen;
    notifyListeners();
  }

  get screen => _screen;

  void hideBottomBar(bool hide) {
    _hide = hide;
    notifyListeners();
  }

  get hide => _hide;
}
