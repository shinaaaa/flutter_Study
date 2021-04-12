import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FireBaseAuthState extends ChangeNotifier {
  FireBaseAuthStatus _fireBaseAuthStatus = FireBaseAuthStatus.SIGN_OUT;
  FirebaseAuth _fireBaseAuth = FirebaseAuth.instance;
  User _firebaseUser;

  void watchAuthChange() {
    _fireBaseAuth.authStateChanges().listen((firebaseUser) {
      if (firebaseUser == null && _firebaseUser == null) {
        return;
      } else if (firebaseUser != _firebaseUser) {
        _firebaseUser = firebaseUser;
        changeFirebaseAuthStatus();
      }
    });
  }

  void signOut() {
    _fireBaseAuthStatus = FireBaseAuthStatus.SIGN_OUT;
    if (_firebaseUser != null) {
      _firebaseUser = null;
      _fireBaseAuth.signOut();
    }
    notifyListeners();
  }

  void changeFirebaseAuthStatus([FireBaseAuthStatus fireBaseAuthStatus]) {
    if (fireBaseAuthStatus != null) {
      _fireBaseAuthStatus = fireBaseAuthStatus;
    } else {
      if (_firebaseUser != null) {
        _fireBaseAuthStatus = FireBaseAuthStatus.SIGN_IN;
      } else {
        _fireBaseAuthStatus = FireBaseAuthStatus.SIGN_OUT;
      }
    }
    notifyListeners();
  }

  FireBaseAuthStatus get fireBaseAuthStatus => _fireBaseAuthStatus;
}

enum FireBaseAuthStatus { SIGN_OUT, PROGRESS, SIGN_IN }
