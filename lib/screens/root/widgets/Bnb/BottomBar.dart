// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:rep_route/routes/RouteGenerator.dart';
import 'package:rep_route/providers/BottomBarProvider.dart';
import 'package:rep_route/screens/root/widgets/Bnb/BottomBarTab.dart';
import 'package:rep_route/theme.dart';

class BottomNavBar extends StatelessWidget {
  late String token;

  BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PersistentTabController _controller =
        PersistentTabController(initialIndex: 0);
    _controller.addListener(() {
      // if(_controller.index==1){
      //   Provider.of<WidgetProvider>(context,listen: false).refreshWidget(true);
      // }else{
      //   Provider.of<WidgetProvider>(context,listen: false).refreshWidget(false);
      // }
    });
    final bottomBarProvider = context.watch<BottomBarProvider>();
    final screen = Provider.of<BottomBarProvider>(context, listen: false);
    return PersistentTabView(
      context,
      controller: _controller,
      screens: screen.screens,
      items: getBottomTabs(screen.getbottombaritems),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style6,
      hideNavigationBar: bottomBarProvider.hide,
    );
  }

  List<PersistentBottomNavBarItem> getBottomTabs(List<MyTabItem> tabs) {
    return tabs
        .map(
          (item) => PersistentBottomNavBarItem(
            icon: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color:
                      primaryDarkblue // Set the background color for the selected tab
                  // Set the background color for unselected tabs
                  ),
              child: SvgPicture.asset(
                item.iconPath,
                color: Colors.white,
                width: 25,
                height: 25,
              ),
            ),
            inactiveIcon: SvgPicture.asset(
              item.iconPath,
              width: 25,
              height: 25,
            ),
            //title: item.title,
            routeAndNavigatorSettings: RouteAndNavigatorSettings(
                onGenerateRoute: RouteGenerator.generateRoute),
            activeColorPrimary: bottombaricon_selected,
            inactiveColorPrimary: bottombaricon_unselected,
            iconSize: 25,
          ),
        )
        .toList();
  }
}
