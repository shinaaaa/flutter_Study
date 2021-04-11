import 'package:flutter/material.dart';
import 'package:instartgram_clone/constants/auth_input_decor.dart';
import 'package:instartgram_clone/constants/common_size.dart';
import 'package:instartgram_clone/models/firebase_auth_state.dart';
import 'package:provider/provider.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  // 사용할 위젯의 상태 저장
  GlobalKey<FormState> _formKey = GlobalKey();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(common_gap),
        child: ListView(
          children: [
            SizedBox(
              height: common_l_gap,
            ),
            Image.asset("assets/images/insta_text_logo.png"),
            TextFormField(
              controller: _emailController,
              cursorColor: Colors.black54,
              decoration: textInputDecor("휴대폰 번호 또는 이메일 주소"),
              validator: (text) {
                if (text.isNotEmpty && text.contains("@"))
                  return null;
                else
                  return "정확한 이메일 주소를 입력해주세요.";
              },
            ),
            SizedBox(
              height: common_xs_gap,
            ),
            TextFormField(
              controller: _passwordController,
              cursorColor: Colors.black54,
              obscureText: true,
              decoration: textInputDecor("비밀번호"),
              validator: (text) {
                if (text.isNotEmpty && text.length > 5)
                  return null;
                else
                  return "올바른 비밀번호를 입력해주세요.";
              },
            ),
            FlatButton(
              onPressed: () {},
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "비밀번호 찾기",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
            SizedBox(
              height: common_s_gap,
            ),
            _submitButton(context),
            SizedBox(
              height: common_s_gap,
            ),
            OrDivider(),
            FlatButton.icon(
              onPressed: () {
                Provider.of<FireBaseAuthState>(context, listen: false)
                    .changeFirebaseAuthStatus(FireBaseAuthStatus.SIGN_IN);},
              textColor: Colors.blue,
              icon: ImageIcon(AssetImage("assets/images/facebook.png")),
              label: Text('Facebook으로 로그인'),
            )
          ],
        ),
      ),
    );
  }

  FlatButton _submitButton(BuildContext context) {
    return FlatButton(
      onPressed: () {
        if (_formKey.currentState.validate()) {
          Provider.of<FireBaseAuthState>(context, listen: false)
              .changeFirebaseAuthStatus(FireBaseAuthStatus.SIGN_IN);
        }
      },
      color: Colors.blue,
      child: Text(
        "로그인",
        style: TextStyle(color: Colors.white),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
    );
  }
}

class OrDivider extends StatelessWidget {
  const OrDivider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          right: 0,
          left: 0,
          height: 1,
          child: Container(
            color: Colors.grey[300],
            height: 1,
          ),
        ),
        Container(
          color: Colors.grey[50],
          height: 1,
          width: 60,
        ),
        Text(
          "OR",
          style:
              TextStyle(color: Colors.grey[500], fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
