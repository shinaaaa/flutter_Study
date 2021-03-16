import 'package:flutter/cupertino.dart'; // iOS cupertino design
import 'package:flutter/material.dart'; // android material design

/// 홈페이지
class HomePage extends StatelessWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Scaffold 기본적인 위젯 모음
    return Scaffold(
      appBar: AppBar(title: Text('cool app')),
      body: Container(
        color: Colors.amber,
      ),
    );
  }
}
