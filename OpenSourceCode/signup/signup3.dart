import 'package:Lumen/components/buttons.dart';
import 'package:Lumen/components/logo.dart';
import 'package:Lumen/components/padding.dart';
import 'package:Lumen/primaryFunctionalPages/mainFourScreens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThirdSignUpPage extends StatelessWidget {
  static String id = 'signup3';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Logo.large(),
            ),
            SignUpSyncContactsText(),
            Hero(
              tag: 'signupTF1',
              child: LoginDivider(),
            ),
            //END Sync Contacts Text and Divider
            SignUpSyncContactsButton(),
            //END Button for Sync Contacts
            Hero(tag: 'signupTF2', child: SignUpSyncAppsText()),
            LoginDivider(),
            //END Sync Contacts Text and Divider
            SignUpSyncAppsButton(),
            //END Button for Sync Apps
            Hero(tag: 'signupTF4', child: SignUp2StepVerificationText()),
            LoginDivider(),
            //END 2 Step Verification Text and Divider
            SignUp2StepVerificationButton(),
            //END Button for 2 Step Verification
            PresetPadding.oneTenthHeight(),
            Hero(
                tag: 'signup',
                child: Buttons.medIrreversibleRouteButton(
                    'Sign Up', Colors.black, context, MainFourScreens.id)),
            //END Sign Up button on the third Sign Up Page
            PresetPadding.oneTwentyHeight(),
          ],
        ),
      ),
    );
  }
}

//Sync Contacts Text
class SignUpSyncContactsText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.transparent,
      child: SizedBox(
        width: 300.0,
        child: Text(
          'Sync your contacts to Connect with your friends already on Lumen!',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

//Sync Apps Text
class SignUpSyncAppsText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.transparent,
      child: SizedBox(
        width: 300.0,
        child: Text(
          'Syncing your apps will allow us to help you build your Profile, and Connection Methods!',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

//2 Step Verification Text
class SignUp2StepVerificationText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.transparent,
      child: SizedBox(
        width: 300.0,
        child: Text(
          'We recommend setting up 2 step verification for added security.',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

//This is the Sync Contacts BUTTON on Page 3 of Sign Up
class SignUpSyncContactsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            top: 0.0,
            bottom: 10.0,
          ),
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  'Sync Contacts',
                  style: TextStyle(
                    fontSize: 21.0,
                    fontWeight: FontWeight.w100,
                    letterSpacing: 0.1,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.left,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 60.0,
                    bottom: 1.5,
                  ),
                  child: Icon(
                    Icons.file_download,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            color: Colors.black,
            padding: EdgeInsets.only(
              top: 4.0,
              bottom: 6.0,
              left: 10.0,
              right: 10.0,
            ),
            onPressed: () => null,
          ),
        ),
      ],
    );
  }
}

//This is the Sync Apps BUTTON on Page 3 of Sign Up
class SignUpSyncAppsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            top: 0.0,
            bottom: 10.0,
          ),
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Sync Apps',
                  style: TextStyle(
                    fontSize: 21.0,
                    fontWeight: FontWeight.w100,
                    letterSpacing: 0.1,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.left,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 98.0,
                    bottom: 1.5,
                  ),
                  child: Icon(
                    Icons.file_download,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            color: Colors.black,
            padding: EdgeInsets.only(
              top: 4.0,
              bottom: 6.0,
              left: 10.0,
              right: 10.0,
            ),
            onPressed: () => null,
          ),
        ),
      ],
    );
  }
}

//This is the 2 Step Verification BUTTON on Page 3 of Sign Up
class SignUp2StepVerificationButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            top: 0.0,
            bottom: 10.0,
          ),
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  '2 Step Verification',
                  style: TextStyle(
                    fontSize: 21.0,
                    fontWeight: FontWeight.w100,
                    letterSpacing: 0.1,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.left,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15.0,
                    bottom: 1.5,
                  ),
                  child: Icon(
                    Icons.lock_open,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            color: Colors.black,
            padding: EdgeInsets.only(
              top: 4.0,
              bottom: 6.0,
              left: 10.0,
              right: 10.0,
            ),
            onPressed: () => null,
          ),
        ),
      ],
    );
  }
}

//Text Underline / Divider Widget for the Login Page
class LoginDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 60.0,
        right: 60.0,
        bottom: 0.0,
      ),
      child: Divider(
        thickness: 1.0,
        color: Colors.black,
      ),
    );
  }
}
