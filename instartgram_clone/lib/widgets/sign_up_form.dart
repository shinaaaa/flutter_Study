import 'package:flutter/material.dart';
import 'package:instartgram_clone/constants/common_size.dart';

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
              decoration: _textInputDecor("비밀번호 확인"),
              validator: (text) {
                if (text.isNotEmpty && _passwordController.text == text)
                  return null;
                else
                  return "비밀번호가 일치하지않습니다. 다시입려해주세요.";
              },
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _textInputDecor(String hint) {
    return InputDecoration(
        hintText: hint,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[300]),
            borderRadius: BorderRadius.circular(common_s_gap)),
        filled: true,
        fillColor: Colors.grey[100]);
  }
}
