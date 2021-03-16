import 'package:flutter/cupertino.dart'; // iOS cupertino design
import 'package:flutter/material.dart'; // android material design
import 'package:instartgram_clone/home_page.dart';

/// "Dart"의 처음 실행되는 부분
void main() {
  // Flutter App 시작되는 부분
  runApp(MyApp());
}

/// StatelessWidget -> 위젯의 상태 변화가 없다.
/// StatefulWidget -> 위젯의 상태 변화가 있다.
class MyApp extends StatelessWidget {
  /// 위젯이 생성되자마자 실행
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
