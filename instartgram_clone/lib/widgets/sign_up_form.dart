import 'package:flutter/material.dart';
import 'package:instartgram_clone/constants/common_size.dart';
import 'package:instartgram_clone/home_page.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  // 사용할 위젯의 상태 저장
  GlobalKey<FormState> _formKey = GlobalKey();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
              decoration: _textInputDecor("휴대폰 번호 또는 이메일 주소"),
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
              decoration: _textInputDecor("비밀번호"),
              validator: (text) {
                if (text.isNotEmpty && text.length > 5)
                  return null;
                else
                  return "올바른 비밀번호를 입력해주세요.";
              },
            ),
            SizedBox(
              height: common_xs_gap,
            ),
            TextFormField(
              controller: _confirmPasswordController,
              cursorColor: Colors.black54,
              obscureText: true,
              decoration: _textInputDecor("비밀번호 확인"),
              validator: (text) {
                if (text.isNotEmpty && _passwordController.text == text)
                  return null;
                else
                  return "비밀번호가 일치하지않습니다. 다시입려해주세요.";
              },
            ),
            SizedBox(
              height: common_s_gap,
            ),
            _submitButton(context),
            SizedBox(
              height: common_s_gap,
            ),
            onDivider(),
            FlatButton.icon(
              onPressed: () {},
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
          /// Navigator => 화면 변경
          /// pushReplacement => 현재 화면을 종료하고 화면을 변경한다.
          /// push => 현재 화면을 뒤로 보내고 화면을 변경한다.
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomePage()));
        }
      },
      color: Colors.blue,
      child: Text(
        "가입",
        style: TextStyle(color: Colors.white),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
    );
  }

  Stack onDivider() {
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

  InputDecoration _textInputDecor(String hint) {
    return InputDecoration(
        hintText: hint,
        enabledBorder: _activieInputBorder(),
        focusedBorder: _activieInputBorder(),
        errorBorder: _errorInputBorder(),
        focusedErrorBorder: _errorInputBorder(),
        filled: true,
        fillColor: Colors.grey[100]);
  }

  OutlineInputBorder _errorInputBorder() {
    return OutlineInputBorder(
        borderSide: BorderSide(color: Colors.redAccent),
        borderRadius: BorderRadius.circular(common_s_gap));
  }

  OutlineInputBorder _activieInputBorder() {
    return OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey[300]),
        borderRadius: BorderRadius.circular(common_s_gap));
  }
}
