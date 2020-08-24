import 'package:Lumen/components/logo.dart';
import 'package:Lumen/components/padding.dart';
import 'package:Lumen/components/textThemes.dart';
import 'package:Lumen/components/textfields.dart';
import 'package:Lumen/firebase/auth.dart';
import 'package:Lumen/login/welcomepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class SecondSignUpPage extends StatefulWidget {
  static String id = 'signup2';
  @override
  _SecondSignUpPageState createState() => _SecondSignUpPageState();
}

class _SecondSignUpPageState extends State<SecondSignUpPage> {
  final AuthService _auth = AuthService();
  bool showLoadingSpinner = false;
  String _pass;
  String email = '';
  String password = '';
  String error = '';

  bool _passwordsMatch = false;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  _submit() {
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      // Logging in the user w/ Firebase
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: showLoadingSpinner,
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
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Hero(
                      tag: 'logo',
                      child: Logo.large(),
                    ),
                    PresetPadding.oneThirtyHeight(),
                    Hero(
                      //TODO: Build Password TextField
                      tag: 'signupTF1',
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: WelcomePage.tenthWidth,
                          right: WelcomePage.tenthWidth,
                        ),
                        child: new Material(
                          color: Colors.transparent,
                          child: TextFormField(
                            controller: _confirmPass,
                            validator: (val) => val.length < 8
                                ? 'Enter a Password 8+ characters long'
                                : null,
                            obscureText: true,
                            onSaved: (input) => password = input,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Create Password',
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
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: WelcomePage.tenthWidth,
                          right: WelcomePage.tenthWidth,
                        ),
                        child: new Material(
                          color: Colors.transparent,
                          child: TextField(
                            obscureText: true,
                            onChanged: (value) {
                              if (value == _pass) {
                                _passwordsMatch = true;
                                password = value;
                              } else {
                                Text('Passwords do not match');
                                //output error message (snackbar or popup) and clear textfields...disable next button?
                                //Perhaps leave the button disabled until the necessary fields are filled in? Or just have a conditional onChanged property?
                              }
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Confirm Password',
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
                    PresetPadding.oneTenthHeight(),
                    Hero(
                        tag: 'signupTF3',
                        child: new Material(
                          color: Colors.transparent,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: WelcomePage.tenthWidth,
                              right: WelcomePage.tenthWidth,
                            ),
                            child: TextFormField(
                              validator: (val) =>
                                  val.isEmpty ? 'Enter a valid email' : null,
                              onSaved: (input) => email = input,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Email',
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
                        )),
                    PresetPadding.oneThirtyHeight(),
                    Hero(tag: 'signupTF4', child: TextFields.phoneTF('Phone')),
                    PresetPadding.oneTwentyHeight(),
                    Hero(
                      //TODO: ASYNC text field
                      tag: 'signup',
                      child: Center(
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                              'Create Account', //this can say 'next' if we'd prefer that
                              style: TextThemes.standardMedWhite()),
                          color: Colors.black,
                          padding: EdgeInsets.only(
                            top: 8.0,
                            bottom: 10.0,
                            left: 60.0,
                            right: 60.0,
                          ),
                          onPressed: () async {
                            if (_formkey.currentState.validate()) {
                              dynamic result =
                                  await _auth.registerWithEmailAndPassword(
                                      email, password);
                              if (result == null) {
                                setState(() =>
                                    error = 'please supply a valid email');
                              }
                            }
                          },
                        ),
                      ),
                    ),
                    PresetPadding.oneTwentyHeight(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
