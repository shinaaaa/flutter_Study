/// "Dart"의 처음 실행되는 부분
import 'package:flutter/material.dart';

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

      // Scaffold 기본적인 위젯 모음
      home: Scaffold(
        appBar: AppBar(title: Text('cool app')),
        body: Container(
          color: Colors.amber,
        ),
      ),
    );
  }
}
