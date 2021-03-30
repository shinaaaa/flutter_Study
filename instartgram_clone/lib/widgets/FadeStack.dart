import 'package:flutter/material.dart';
import 'package:instartgram_clone/screens/profile_screen.dart';
import 'package:instartgram_clone/widgets/sign_in_form.dart';
import 'package:instartgram_clone/widgets/sign_up_form.dart';

class FadeStack extends StatefulWidget {
  final int selectForm;

  const FadeStack({Key key, this.selectForm}) : super(key: key);

  @override
  _FadeStackState createState() => _FadeStackState();
}

class _FadeStackState extends State<FadeStack>
    with SingleTickerProviderStateMixin {
  List<Widget> forms = [SignUpForm(), SignInForm()];
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: duration);
    _animationController.forward();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant FadeStack oldWidget) {
    if (widget.selectForm != oldWidget.selectForm)
      _animationController.forward(from: 0.0);
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animationController,
      child: IndexedStack(
        index: widget.selectForm,
        children: forms,
      ),
    );
  }
}
