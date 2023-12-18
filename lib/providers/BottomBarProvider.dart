// // ignore_for_file: camel_case_types

// import 'dart:ffi';

// import 'package:Bookngly/screens/AppointmentScreen.dart';
// import 'package:Bookngly/screens/HomeScreen.dart';
// import 'package:Bookngly/screens/InboxScreen.dart';
// import 'package:Bookngly/screens/ProfileScreen.dart';
// import 'package:Bookngly/screens/RootScreen.dart';
// import 'package:Bookngly/screens/DetailScreen.dart';
// import 'package:Bookngly/screens/WishListScreen.dart';
// import 'package:Bookngly/widgets/BottomBarWidgets/BottomBarTab.dart';
// import 'package:flutter/material.dart';

// class BottomBarProvider extends ChangeNotifier {
//   int _currentTab = 0;
//   Widget _screen = HomeScreen();
//   bool _hide = false;


//   final List<Widget> screens = [
//     HomeScreen(),
//     WishListScreen(),
//     AppointmentScreen(),
//     InboxScreen(),
//     ProfileScreen()
//   ];

//   final List<MyTabItem> _bottombaritems = [
//     MyTabItem('Explore', Icons.search),
//     MyTabItem('Wishlist', Icons.favorite_border),
//     MyTabItem('Appointment', Icons.calendar_month),
//     MyTabItem('Inbox', Icons.message),
//     MyTabItem('Profile', Icons.person),
//   ];

//   get getbottombaritems => _bottombaritems;

//   set screen(screen) {
//     _screen = screen;
//     notifyListeners();
//   }

//   get screen => _screen;

//   void hideBottomBar(bool hide) {
//     _hide = hide;
//     notifyListeners();
//   }

//   get hide => _hide;
// }
