import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:rep_route/screens/root/widgets/Bnb/BottomBar.dart';
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
                margin:
                    EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                child: ClipOval(
                  child: Image.asset('assets/images/hemsworth.jpeg',
                      fit: BoxFit.cover),
                ),
              ),
              actions: [
                IconButton(
                  color: Colors.amber,
                  padding: EdgeInsets.only( top:10,bottom: 10),
                  icon: Image.asset(
                    'assets/logo/reproute_logo.png',
                  ),
                  iconSize: 80,
                  onPressed: () {},
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
