import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_chat/model/user.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(userId: user.uid) : null;
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser firebaseUser = result.user;
      return _userFromFirebaseUser(firebaseUser);
    } catch (authsigninfail) {
      print(authsigninfail.toString());
    }
  }

  Future signUpWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword
      (email: email, password: password);
      FirebaseUser firebaseUser = result.user;
      return _userFromFirebaseUser(firebaseUser);
    } 
    catch (authsign_upfail) {
      print(authsign_upfail.toString());
    }
  }
  Future resetPass(String email) async {
    try {
      return await _auth.sendPasswordResetEmail
      (email: email);
    } catch (resetpassfail) {
      print(resetpassfail.toString());
    }
  }
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (signoutfail) {
      print(signoutfail.toString());
    }
  }
}
