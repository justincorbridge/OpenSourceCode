import 'package:Lumen/components/logo.dart';
import 'package:Lumen/components/padding.dart';
import 'package:Lumen/signup/signup2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../login/welcomepage.dart';
import 'package:Lumen/firebase/auth.dart';

class FirstSignUpPage extends StatefulWidget {
  static String id = 'signup1';
  static double screenHeight;

  @override
  _FirstSignUpPageState createState() => _FirstSignUpPageState();
}

class _FirstSignUpPageState extends State<FirstSignUpPage> {
  final AuthService _auth = AuthService();

  final _formKey = GlobalKey<FormState>();
  String firstname = '';
  String lastname = '';
  String username = '';
  String birthday = '';
  String citystate = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Hero(tag: 'backArrow', child: Icon(Icons.arrow_back)),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.black,
          ),
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: WelcomePage.screenHeight - WelcomePage.appBarHeight,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Hero(
                    tag: 'logo',
                    child: Logo.large(),
                  ),
                  PresetPadding.oneThirtyHeight(),
                  Hero(
                    tag: 'signupTF1',
                    child: Material(
                      //makes it animatable.
                      color: Colors.transparent,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: WelcomePage.tenthWidth,
                          right: WelcomePage.tenthWidth,
                        ),
                        child: TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter a name';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'First Name',
                            hintStyle: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w100,
                              fontStyle: FontStyle.italic,
                              color: Colors.black26,
                              letterSpacing: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  PresetPadding.oneThirtyHeight(),
                  Hero(
                    tag: 'signupTF2',
                    child: Material(
                      //makes it animatable.
                      color: Colors.transparent,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: WelcomePage.tenthWidth,
                          right: WelcomePage.tenthWidth,
                        ),
                        child: TextFormField(
                          validator: (val) =>
                              val.isEmpty ? 'Enter a name' : null,
                          onChanged: (val) {
                            setState(() => lastname = val);
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Last Name',
                            hintStyle: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w100,
                              fontStyle: FontStyle.italic,
                              color: Colors.black26,
                              letterSpacing: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  PresetPadding.oneThirtyHeight(),
                  Hero(
                    tag: 'SignupTF2',
                    child: Material(
                      //makes it animatable.
                      color: Colors.transparent,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: WelcomePage.tenthWidth,
                          right: WelcomePage.tenthWidth,
                        ),
                        child: TextFormField(
                          validator: (val) =>
                              val.isEmpty ? 'Enter valid username' : null,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Username',
                            hintStyle: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w100,
                              fontStyle: FontStyle.italic,
                              color: Colors.black26,
                              letterSpacing: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  PresetPadding.oneTwentyHeight(),
                  Hero(
                    tag: 'signupTF3',
                    child: Material(
                      //makes it animatable.
                      color: Colors.transparent,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: WelcomePage.tenthWidth,
                          right: WelcomePage.tenthWidth,
                        ),
                        child: TextFormField(
                          onChanged: (val) {
                            setState(() => birthday = val);
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Birthday(mm/dd/yyyy)',
                            hintStyle: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w100,
                              fontStyle: FontStyle.italic,
                              color: Colors.black26,
                              letterSpacing: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  PresetPadding.oneThirtyHeight(),
                  PresetPadding.oneTwentyHeight(),
                  Hero(
                    tag: 'signup',
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: SizedBox(
                        width: WelcomePage.tenthWidth * 5.2,
                        height: WelcomePage.tenthHeight / 2.7,
                        child: FittedBox(
                          fit: BoxFit.fitHeight,
                          child: Text(
                            'Next',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      color: Colors.black,
                      padding: EdgeInsets.only(
                        top: WelcomePage.tenthHeight / 7,
                        bottom: WelcomePage.tenthHeight / 5.5,
                        left: WelcomePage.tenthWidth / 3,
                        right: WelcomePage.tenthWidth / 3,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, SecondSignUpPage.id);
                      },
                    ),
                  ),
                  PresetPadding.oneThirtyHeight(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
