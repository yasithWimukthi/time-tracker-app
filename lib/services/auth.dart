import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class User{
  User({@required this.uid});
  final String uid;
}

abstract class AuthBase{
  Future<FirebaseUser> currentUser();
  Future<FirebaseUser> signInAnonymously();
  Future<void> signOut();
}

class Auth implements AuthBase{

  final _firebaseAuth = FirebaseAuth.instance;

  User _userFromFirebase(FirebaseUser user){
    if(user==null){
      return null;
    }
    return User(uid:user.uid);
  }

  @override
  Future<FirebaseUser> currentUser() async {
    final user = await _firebaseAuth.currentUser();
    return _userFromFirebase(user);
  }

  @override
  Future<FirebaseUser> signInAnonymously() async {
      final authResult = await _firebaseAuth.signInAnonymously();
      return _userFromFirebase(authResult.user);
  }

  @override
  Future<void> signOut() async {
      await _firebaseAuth.signOut();
  }
}