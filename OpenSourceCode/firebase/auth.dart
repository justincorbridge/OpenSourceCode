import 'package:Lumen/firebase/user_data.dart';
import 'package:Lumen/firebase/user_model.dart';
import 'package:Lumen/login/welcomepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class AuthService {
  static final auth = FirebaseAuth.instance;
  static final _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  /* User _userFromFirebaseUser(User user) {
    return user != null ? User(id: user.uid) : null;
  } */

//Sign Up function
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//Logout function
  static Future<void> logout(context) async {
    await auth.signOut();
    Navigator.pop(context, WelcomePage.id);
    Navigator.pushReplacementNamed(context, WelcomePage.id);
  }
}
