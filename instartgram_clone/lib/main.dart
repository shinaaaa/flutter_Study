import 'package:flutter/cupertino.dart'; // iOS cupertino design
import 'package:flutter/material.dart'; // android material design
import 'package:instartgram_clone/constants/material_white.dart';
import 'package:instartgram_clone/home_page.dart';
import 'package:instartgram_clone/models/firebase_auth_state.dart';
import 'package:instartgram_clone/screens/auth_screen.dart';
import 'package:instartgram_clone/screens/profile_screen.dart';
import 'package:instartgram_clone/widgets/my_progress_indicator.dart';
import 'package:provider/provider.dart';

/// "Dart"의 처음 실행되는 부분
void main() {
  // Flutter App 시작되는 부분
  runApp(MyApp());
}

/// StatelessWidget -> 위젯의 상태 변화가 없다.
/// StatefulWidget -> 위젯의 상태 변화가 있다.
class MyApp extends StatelessWidget {
  FireBaseAuthState _fireBaseAuthState = FireBaseAuthState();
  Widget _currentWidget;

  /// 위젯이 생성되자마자 실행
  @override
  Widget build(BuildContext context) {
    _fireBaseAuthState.watchAuthChange();

    return ChangeNotifierProvider.value(
      value: _fireBaseAuthState,
      child: MaterialApp(
          home: Consumer(
              builder: (BuildContext context,
                  FireBaseAuthState fireBaseAuthState, Widget child) {
                switch (fireBaseAuthState.fireBaseAuthStatus) {
                  case FireBaseAuthStatus.SIGN_OUT:
                    _currentWidget = AuthScreen();
                    break;
                  case FireBaseAuthStatus.SIGN_IN:
                    _currentWidget = HomePage();
                    break;
                  default:
                    _currentWidget = MyProgressIndicator();
                    break;
                }
                return AnimatedSwitcher(
                  child: _currentWidget,
                  duration: duration,
                );
              },
              child: HomePage()),
          theme: ThemeData(primarySwatch: white)),
    );
  }
}
