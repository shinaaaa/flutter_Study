import 'package:flutter/material.dart';
import 'package:instartgram_clone/widgets/FadeStack.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  int selectForm = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset => 키보드 활성화시 화면 크기 축소 안함
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Stack(children: [
          FadeStack(
            selectForm: selectForm,
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 40,
            child: Container(
                color: Colors.white,
                child: FlatButton(
                  shape: Border(top: BorderSide(color: Colors.grey)),
                  onPressed: () {
                    setState(() {
                      if (selectForm == 0)
                        selectForm = 1;
                      else
                        selectForm = 0;
                    });
                  },
                  child: RichText(
                    text: TextSpan(
                        text: (selectForm == 1 ? "계정이 없으신가요? " : "계정이 있으신가요? "),
                        style: TextStyle(color: Colors.black45),
                        children: [
                          TextSpan(
                              text: (selectForm == 1 ? "가입하기" : "로그인"),
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold))
                        ]),
                  ),
                )),
          )
        ])));
  }
}
