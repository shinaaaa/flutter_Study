import 'package:flutter/material.dart';
import 'package:instartgram_clone/widgets/FadeStack.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  int selectForm = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
      FadeStack(
        selectForm: selectForm,
      ),
      Container(
          child: FlatButton(
        onPressed: () {
          setState(() {
            if (selectForm == 0)
              selectForm = 1;
            else
              selectForm = 0;
          });
        },
        child: Text("go to sign"),
      ))
    ])));
  }
}
