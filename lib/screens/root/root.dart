import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:rep_route/screens/root/widgets/BottomBar.dart';
import 'package:rep_route/theme.dart';

class RootScreen extends StatelessWidget {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    //Apis.init(context);
    //DatabaseHandler.init();
    //SharedPref.init();
    return OverlaySupport(
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            appBar: AppBar(
              toolbarHeight: 80.0,
              backgroundColor: white,
              elevation: 0,
              leadingWidth: 80,
              leading: Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: IconButton(
                    icon: Transform.scale(
                      scale: 1,
                      child: Image.asset('assets/logo/reproute_logo.png'),
                    ), // Icon on the left
                    onPressed: () {},
                  ),
                ),
              ),
              actions: [
                Container(
                  width: 80,
                  height: 80,
                  child: Padding(
                    padding: EdgeInsets.all(13),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/hemsworth.jpeg',
                        height: 80,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            resizeToAvoidBottomInset: false,
            body: Stack(
              children: [
                SafeArea(
                  child: Scaffold(
                    bottomNavigationBar: BottomNavBar(),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  // showLoaderDialog(BuildContext context) {
  //   showDialog(
  //     useSafeArea: false,
  //     context: context,
  //     builder: (BuildContext context) {
  //       return LoadingWidget();
  //     },
  //   );
  // }
}
