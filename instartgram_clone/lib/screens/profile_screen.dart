import 'package:flutter/material.dart';
import 'package:instartgram_clone/constants/screen_size.dart';
import 'package:instartgram_clone/widgets/profile_body.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final duration = Duration(milliseconds: 300);
  final memWidth = size.width / 2;
  MenuStatus _menuStatus = MenuStatus.closed;
  double bodyXpos = 0;
  double menuXpos = size.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: Stack(
          children: [
            AnimatedContainer(
              duration: duration,
              curve: Curves.fastOutSlowIn,
              child: ProfileBody(onMenuChanged: () {
                setState(() {
                  _menuStatus = (_menuStatus == MenuStatus.closed)
                      ? MenuStatus.opened
                      : MenuStatus.closed;
                  switch (_menuStatus) {
                    case MenuStatus.closed:
                      bodyXpos = -memWidth;
                      menuXpos = size.width - memWidth;
                      break;
                    case MenuStatus.opened:
                      bodyXpos = 0;
                      menuXpos = size.width;
                      break;
                  }
                });
              }),
              transform: Matrix4.translationValues(bodyXpos, 0, 0),
            ),
            AnimatedContainer(
              duration: duration,
              curve: Curves.fastOutSlowIn,
              transform: Matrix4.translationValues(menuXpos, 0, 0),
              child: Positioned(
                top: 0,
                bottom: 0,
                width: size.width / 2,
                child: Container(
                  color: Colors.pink,
                ),
              ),
            ),
          ],
        ));
  }
}

enum MenuStatus { opened, closed }
