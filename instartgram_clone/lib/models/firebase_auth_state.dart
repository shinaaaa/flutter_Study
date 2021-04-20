import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FireBaseAuthState extends ChangeNotifier {
  FireBaseAuthStatus _fireBaseAuthStatus = FireBaseAuthStatus.SIGN_OUT;
  FirebaseAuth _fireBaseAuth = FirebaseAuth.instance;
  FirebaseUser _firebaseUser;

  void watchAuthChange() {
    _fireBaseAuth.onAuthStateChanged.listen((firebaseUser) {
      if (firebaseUser == null && _firebaseUser == null) {
        return;
      } else if (firebaseUser != _firebaseUser) {
        _firebaseUser = firebaseUser;
        changeFirebaseAuthStatus();
      }
    });
  }

  /// 회원 가입
  void registerUser(BuildContext context,
      {@required String email, @required String password}) {
    _fireBaseAuth
        .createUserWithEmailAndPassword(
            email: email.trim(), password: password.trim())
        .catchError((error) {
      String _message = "";
      switch (error.code) {
        case "ERROR_WEAK_PASSWORD":
          _message = "패스워드를 다시 입력해주세요.";
          break;
        case "ERROR_INVALID_EMAIL":
          _message = "이메일을 다시 입력해주세요.";
          break;
        case "ERROR_EMAIL_ALREADY_IN_USE":
          _message = "이미 사용중인 이메일입니다.";
          break;
      }
      SnackBar snackBar = SnackBar(
        content: Text(_message),
      );
      Scaffold.of(context).showSnackBar(snackBar);
    });
  }

  // 로그인
  void login(BuildContext context,
      {@required String email, @required String password}) {
    _fireBaseAuth
        .signInWithEmailAndPassword(
            email: email.trim(), password: password.trim())
        .catchError((error) {
      String _message = "";
      switch (error.code) {
        case "ERROR_INVALID_EMAIL":
          _message = "이메일이 다름니다.";
          break;
        case "ERROR_WRONG_PASSWORD":
          _message = "비밀번호가 다릅니다.";
          break;
        case "ERROR_USER_NOT_FOUND":
          _message = "존재하지않는 계정입니다.";
          break;
        case "ERROR_USER_DISABLED":
          _message = "정지된 계정입니다.";
          break;
        case "ERROR_TOO_MANY_REQUESTS":
          _message = "이미 요청되었습니다. 잠시후 다시 요청해주세요.";
          break;
        case "ERROR_OPERATION_NOT_ALLOWED":
          _message = "접근 불가능한 계정입니다.";
          break;
      }
      SnackBar snackBar = SnackBar(
        content: Text(_message),
      );
      Scaffold.of(context).showSnackBar(snackBar);
    });
  }

  /// 로그아웃
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
