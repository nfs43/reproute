import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rep_route/screens/root/widgets/DoctorPointerSheet.dart';
import 'package:rep_route/screens/root/widgets/DoctorsList.dart';
import 'package:rep_route/screens/root/widgets/FIlterSheet.dart';
import 'package:rep_route/screens/root/widgets/MapView.dart';
import 'package:rep_route/theme.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() {
    return _DashboardState();
  }
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {
      _tabController.index;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Color getTextColor(int tabIndex) {
    return tabIndex == 0 ? Colors.white : Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
        color: dashboardbg,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10, right: 20, left: 20),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: (){
                          showModalBottomSheet(
                        context: context,
                              useRootNavigator: true,

                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        builder: (BuildContext context) {
                          return DoctorPointerSheet();
                        },
                      );
                    },
                    child: Text(
                      'Map',
                      style: mainHeading,
                    ),
                  ),
                  Spacer(), // This will space the items evenly

                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                              useRootNavigator: true,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        builder: (BuildContext context) {
                          return FilterSheet();
                        },
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      padding: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 1,
                        ),
                        color: Colors.white,
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/filter_dashboard.svg',
                        width: 25,
                        height: 25,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, right: 20, left: 20),
              padding: const EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                boxShadow: [],
              ),
              child: TabBar(
                controller: _tabController,
                padding: const EdgeInsets.all(0.0),
                isScrollable: false,
                unselectedLabelColor: textBlack,
                // indicatorPadding: EdgeInsets.zero,
                // indicatorSize: TabBarIndicatorSize.label,
                indicator: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  // color: Color(0xFFFBD59E)
                ),
                tabs: [
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Image.asset(
                            color: _tabController.index == 1
                                ? textGreyDark
                                : primaryDarkblue,
                            'assets/icons/map.png',
                            width: 24, // Set the width of the image
                            height: 24, // Set the height of the image
                            // You can also use other image widgets or decorations here
                          ),
                        ),
                        Text(
                          "Map results",
                          style: TextStyle(
                            color: _tabController.index == 1
                                ? textGreyDark
                                : primaryDarkblue,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Add your image here
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 8.0), // Adjust spacing as needed
                          child: Image.asset(
                            color: _tabController.index == 0
                                ? textGreyDark
                                : primaryDarkblue,
                            'assets/icons/list.png',
                            width: 24,
                            height: 24,
                          ),
                        ),
                        Text(
                          "List",
                          style: TextStyle(
                            color: _tabController.index == 0
                                ? textGreyDark
                                : primaryDarkblue,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    MapView(),
                    DoctorsListing(),
                  ],
                ),
              ),
            )
          ],
        ),
    );
  }
}
