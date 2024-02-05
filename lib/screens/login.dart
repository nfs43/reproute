// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_final_fields, unused_field, prefer_typing_uninitialized_variables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:rep_route/network/request/SigninRequest.dart';
import 'package:rep_route/providers/signInProvider.dart';
import 'package:rep_route/routes/Routes.dart';
import 'package:rep_route/theme.dart';
import 'package:rep_route/utils/utils.dart';
import 'package:rep_route/widgets/InputFIeld.dart';
import 'package:rep_route/widgets/PrimaryButton.dart';
import 'package:rep_route/widgets/ProgressIndicator/LoadingWidget.dart';
import 'package:rep_route/widgets/buttonIcon.dart';
import 'package:rep_route/widgets/horizontalineOr.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _signinformKey = GlobalKey<FormState>();

  final GoogleSignIn googleSignIn = GoogleSignIn();

  int _current = 0;
  final CarouselController _controller = CarouselController();
  var imglist = [
    'assets/images/mac.png',
    'assets/images/mac.png',
    'assets/images/mac.png',
    'assets/images/mac.png',
  ];
  final TextEditingController nameController = TextEditingController(text: '');
  final TextEditingController companynameController =
      TextEditingController(text: '');

  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');
  bool _isloading = false;
  bool _isChecked = false;
  bool passwordVisible = false;
  late SignInProvider signInProvider;

  @override
  void initState(){
    super.initState();
    emailController.text="huzaifa90@gmail.com";
    passwordController.text="123456";
  }


  Future<void> signIn(SignInRequest signInRequest) async {
    try {
      await signInProvider.signInUser(context, signInRequest);
      // Handle success or perform any other logic after sign up
    } catch (error) {
      print(error.toString());
      // Handle errors and show error messages
    }
  }

  Future<void> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance
        .login(permissions: ['email', 'public_profile', 'user_birthday']);

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);

    // Access user information
    User? user = userCredential.user;
    //print('User email: ${user?.email}');
    //print('Token: ${loginResult.accessToken!.token}');

    signIn(SignInRequest(
      email: user?.email,
      issocial: true,
      googleToken: null,
      password: null,
      facebookToken: null,
      socialToken:user!.uid 
    ));
  }

  void togglePassword() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    double isTablet = MediaQuery.of(context).size.width;
    bool isTabletlhorizontal =
        isTablet >= 600 && orientation == Orientation.landscape;

    signInProvider = Provider.of<SignInProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: primaryGrey,
      body: SafeArea(child:
          Consumer<SignInProvider>(builder: (context, signIpProvider, _) {
        return Stack(
          children: [
            SingleChildScrollView(
              child: isTabletlhorizontal
                  ? _buildHorizontalLayout()
                  : _buildVerticalLayout(),
            ),
            if (signInProvider.isLoading) Center(child: LoadingWidget()),
          ],
        );
      })),
    );
  }

  Widget _buildVerticalLayout() {
    return Column(
      children: [
        _buildTopSection(30),
        _buildCarouselSlider(200),
        _buildFeatureSection(),
        _buildCarouselIndicator(),
        _buildLoginSection(20, 0, 30, 20),
      ],
    );
  }

  Widget _buildHorizontalLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            children: [
              _buildTopSection(50),
              _buildCarouselSlider(350),
              _buildFeatureSection(),
              _buildCarouselIndicator(),
            ],
          ),
        ),
        Expanded(
          child: _buildLoginSection(40, 20, 50, 20),
        ),
      ],
    );
  }

  Widget _buildTopSection(double tm) {
    return Container(
      margin: EdgeInsets.only(top: tm, bottom: 60),
      width: double.infinity,
      child: Image.asset('assets/logo/full_logo.png', height: 130),
    );
  }

  Widget _buildCarouselSlider(double height) {
    return CarouselSlider(
      carouselController: _controller,
      options: CarouselOptions(
        height: height,
        aspectRatio: 16 / 9,
        viewportFraction: 1,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: false,
        onPageChanged: (index, reason) {
          setState(() {
            _current = index;
          });
        },
        scrollDirection: Axis.horizontal,
      ),
      items: imglist.map((String assetPath) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              child: Image.asset(
                assetPath,
                fit: BoxFit.contain,
              ),
            );
          },
        );
      }).toList(),
    );
  }

  Widget _buildFeatureSection() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Feature Placeholder',
            overflow: TextOverflow.ellipsis,
            style: mainHeading.copyWith(color: Colors.black),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              'Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed qu',
              maxLines: 4,
              textAlign: TextAlign.justify,
              overflow: TextOverflow.ellipsis,
              style: normalText.copyWith(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCarouselIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: imglist.asMap().entries.map((entry) {
        return GestureDetector(
          onTap: () => _controller.animateToPage(entry.key),
          child: Container(
            width: 12.0,
            height: 12.0,
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black)
                  .withOpacity(_current == entry.key ? 0.9 : 0.4),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildLoginSection(
    double hp,
    double vp,
    double vm,
    double hm,
  ) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: vm, horizontal: hm),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 15.0,
              offset: Offset(0.0, 0.75),
            )
          ],
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: hp, vertical: vp),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 30),
                width: double.infinity,
                child: Text('Login to Reproute',
                    overflow: TextOverflow.ellipsis,
                    style: mainHeading.copyWith(
                      color: Colors.black,
                    )),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                width: double.infinity,
                child: RichText(
                  text: TextSpan(
                    text: 'Dont have an account? ',
                    style: normalText.copyWith(color: Colors.black),
                    children: <InlineSpan>[
                      WidgetSpan(
                        child: SizedBox(
                          width: 10,
                        ),
                      ),
                      TextSpan(
                        text: 'Create a free account',
                        style: smallblueBoldtext.copyWith(),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushReplacementNamed(
                                context, RoutesName.signUpScreen);
                          },
                      ),
                    ],
                  ),
                ),
              ),
              ButtonIcon(
                imagePath: 'assets/icons/google.png',
                btntext: 'Login with Google',
                onPressed: () async {
                  //Google SignIn
                  final GoogleSignInAccount? googleUser =
                      await googleSignIn.signIn();

                  if (googleUser != null) {
                    final GoogleSignInAuthentication googleAuth =
                        await googleUser.authentication;

                    final OAuthCredential credential =
                        GoogleAuthProvider.credential(
                      accessToken: googleAuth.accessToken,
                      idToken: googleAuth.idToken,
                    );

                    // Force the account chooser by passing 'select_account' as prompt
                    final UserCredential userCredential = await FirebaseAuth
                        .instance
                        .signInWithCredential(credential);

                    final User? user = userCredential.user;
                    print('UserEmail:' + user!.email.toString());
                    print('GmailToken:' + googleAuth.accessToken.toString());

                    signIn(SignInRequest(
                      email: user.email,
                      issocial: true,
                      googleToken: null,
                      password: null,
                      facebookToken: null,
                      socialToken: user.uid
                    ));
                  }
                },
              ),
              Container(
                padding: EdgeInsets.only(top: 15, bottom: 15),
                child: ButtonIcon(
                  imagePath: 'assets/icons/facebook.png',
                  btntext: 'Login with Facebook',
                  onPressed: () {
                    //Facenook Signin
                    signInWithFacebook();
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 20),
                child: HorizontalOrLine(
                  label: 'Or',
                  height: 1,
                  thickness: 1,
                ),
              ),
              Form(
                key: _signinformKey,
                child: Column(
                  children: [
                    Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: 10, top: 20),
                        child: Text('Email Address',
                            style: labelInput.copyWith(color: textBlack))),
                    InputField(
                      hintText: 'Enter email to get started',
                      // suffixIcon: const SizedBox(),
                      controller: emailController,
                      validator: validateEmail,
                      textInputAction: TextInputAction.next,
                    ),
                    Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: 10, top: 20),
                        child: Text('Password',
                            style: labelInput.copyWith(color: textBlack))),
                    InputField(
                      hintText: 'Enter your password',
                      controller: passwordController,
                      obscureText: !passwordVisible,
                      validator: validateInputString,
                      // suffixIcon: IconButton(
                      //   color: Colors.black,
                      //   splashRadius: 1,
                      //   icon: Icon(passwordVisible
                      //       ? Icons.visibility_outlined
                      //       : Icons.visibility_off_outlined),
                      //   onPressed: togglePassword,
                      // ),
                      textInputAction: TextInputAction.done,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 30),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 10),
                      child: Theme(
                        data: ThemeData(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          visualDensity:
                              VisualDensity(horizontal: -4.0, vertical: -4.0),
                        ),
                        child: Checkbox(
                          value: _isChecked,
                          onChanged: (newValue) {
                            FocusManager.instance.primaryFocus?.unfocus();
                            setState(() {
                              _isChecked = newValue!;
                              print(newValue);
                            });
                          },
                          side: BorderSide(
                              color: Colors.grey.shade400,
                              style: BorderStyle.solid,
                              width: 2),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Remember me',
                        style: smallboldtext.copyWith(color: Colors.black),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, RoutesName.forgotPasswordScreen);
                      },
                      child: Text(
                        'Forgot Password?',
                        style: smallblueBoldtext.copyWith(),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 30, bottom: 20),
                child: CustomPrimaryButton(
                  buttonColor: buttonbg,
                  textValue: 'Login',
                  textColor: Colors.white,
                  onPressed: () async {
                    if (_signinformKey.currentState!.validate()) {
                      signIn(SignInRequest(
                        email: emailController.text,
                        issocial: false,
                        googleToken: null,
                        password: passwordController.text,
                        facebookToken: null,
                        socialToken: null
                      ));
                    }
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
