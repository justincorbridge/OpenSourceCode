import 'package:Lumen/firebase/auth.dart';
import 'package:Lumen/login/forgot_password_page.dart';
import 'package:Lumen/login/main_login.dart';
import 'package:Lumen/usersettings/other_tile_edit.dart';
import 'package:Lumen/usersettings/preset_tile_edit.dart';
import 'package:Lumen/primaryFunctionalPages/messages/messages.chat.dart';
import 'package:Lumen/usersettings/tile_selector_page.dart';
import 'package:Lumen/usersettings/editprofile_page.dart';
import 'package:Lumen/usersettings/profile_settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Lumen/primaryFunctionalPages/mainFourScreens.dart';
import 'package:Lumen/primaryFunctionalPages/messages/messageshomepage_widget.dart';
import 'package:Lumen/signup/signup1.dart';
import 'package:Lumen/signup/signup2.dart';
import 'package:Lumen/signup/signup3.dart';
import 'package:provider/provider.dart';
import 'login/welcomepage.dart';
import 'primaryFunctionalPages/mainFourScreens.dart';
import 'package:Lumen/firebase/user_data.dart';

import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Center(child: Text('something went wrong'));
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            home: _getScreenId(),
            routes: {
              //Dart knows that '/' is the default route, essentailly the same thing as 'home:'
              WelcomePage.id: (context) => WelcomePage(),
              MainFourScreens.id: (context) => MainFourScreens(0),
              //MessagesHomePage.id: (context) => MessagesHomePage(),
              MainLogin.id: (context) => MainLogin(),
              FirstSignUpPage.id: (context) => FirstSignUpPage(),
              SecondSignUpPage.id: (context) => SecondSignUpPage(),
              ThirdSignUpPage.id: (context) => ThirdSignUpPage(),
              ForgotPasswordPage.id: (context) => ForgotPasswordPage(),
              ProfileSettingsPage.id: (context) => ProfileSettingsPage(),
              EditProfilePage.id: (context) => EditProfilePage(),
              //IndividualChatPage.id: (context) => IndividualChatPage(),
              TileSelectorPage.id: (context) => TileSelectorPage(),
              PresetTileConnection.id: (context) => PresetTileConnection(),
              OtherTileConnection.id: (context) => OtherTileConnection(),
            },
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  _getScreenId() {
    FirebaseAuth.instance.authStateChanges().listen((User user) {
      print('user $user');
      if (user == null) {
        return WelcomePage();
      }
      return MainFourScreens(0);
    });
  }
} /* Widget _getScreenId() {
    return StreamBuilder<User>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          Provider.of<UserData>(context).currentUserId = snapshot.data.uid;
          return MainFourScreens(0);
        } else {
          return WelcomePage();
        }
      },
    );
  } */
/* 
@override
Widget build(BuildContext context) {
  return ChangeNotifierProvider(
    create: (context) => UserData(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.lightBlue.shade400,
        accentColor: Colors.grey.shade900,
        fontFamily: 'Source Sans Pro',

        /* colorScheme: ColorScheme(
              primary: Color(0xFFA7DADB),
              primaryVariant: Color(0xFFD3E5E6),
              secondary: Color(0xFF2B8FAB),
              secondaryVariant: Color(0xFF285A68),
              surface: Colors.white,
              background: Colors.white,
              error: Color(0xFFC9212F),
              onPrimary: Colors.black,
              onSecondary: Colors.white,
              onSurface: Colors.black,
              onBackground: Colors.black
              ,
              onError: Colors.white,
              brightness: Brightness.light), */
        //Look this one up in the flutter docs later on...we can use it to create default text styles and reference those.
        //textTheme: TextTheme(),
      ),
      //I don't know if this is a central title which can be inherited by every page (i.e. 'Instagram')...TBD.
      //title: '',
      home: _getScreenId(),
      routes: {
        //Dart knows that '/' is the default route, essentailly the same thing as 'home:'
        WelcomePage.id: (context) => WelcomePage(),
        MainFourScreens.id: (context) => MainFourScreens(0),
        MessagesHomePage.id: (context) => MessagesHomePage(),
        MainLogin.id: (context) => MainLogin(),
        FirstSignUpPage.id: (context) => FirstSignUpPage(),
        SecondSignUpPage.id: (context) => SecondSignUpPage(),
        ThirdSignUpPage.id: (context) => ThirdSignUpPage(),
        ForgotPasswordPage.id: (context) => ForgotPasswordPage(),
        ProfileSettingsPage.id: (context) => ProfileSettingsPage(),
        EditProfilePage.id: (context) => EditProfilePage(),
        IndividualChatPage.id: (context) => IndividualChatPage(),
        TileSelectorPage.id: (context) => TileSelectorPage(),
        PresetTileConnection.id: (context) => PresetTileConnection(),
        OtherTileConnection.id: (context) => OtherTileConnection(),
      },
      //There are so many arguments we can include in the ThemeData...really for whatever we need. Just check this out: https://api.flutter.dev/flutter/material/ThemeData-class.html
    ),
  );
}
 */
