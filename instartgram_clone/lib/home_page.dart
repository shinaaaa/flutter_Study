import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instartgram_clone/screens/camera_screen.dart';
import 'package:instartgram_clone/screens/feed_srceen.dart';
import 'package:instartgram_clone/screens/profile_screen.dart';
import 'package:instartgram_clone/screens/search_screen.dart';
import 'package:permission_handler/permission_handler.dart';

import 'constants/screen_size.dart'; // android material design

/// 홈페이지
class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  /// 상태 변화 생길때 마다 재 생성
  @override
  _HomePageState createState() => _HomePageState();
}

/// 네비게이션 버튼 목록
class _HomePageState extends State<HomePage> {
  List<BottomNavigationBarItem> btmNavItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.add), label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.healing), label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: ''),
  ];

  // 선택된 네비게이션
  int _selectedIndex = 0;
  GlobalKey<ScaffoldState> _key = GlobalKey();

  /// 화면 전환
  static List<Widget> _screens = <Widget>[
    FeedScreen(),
    SearchScreen(),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.deepPurple,
    ),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    if (size == null) size = MediaQuery.of(context).size;

    // Scaffold 기본적인 위젯 모음
    return Scaffold(
      key: _key,

      /// IndexedStack
      /// 화면전환시 레이아웃을 새로 그리는 것을 방지
      /// Stack에 쌓아 놓고 원하는 페이지를 최상단으로 오림
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        // 선택된 아이콘의 레이블
        showSelectedLabels: false,
        // 선택 안된 아이콘의 레이블
        showUnselectedLabels: false,
        // 네비게이션 목록
        items: btmNavItems,
        // 선택이 안된 경우
        unselectedItemColor: Colors.grey,
        // 선택이 된 경우
        selectedItemColor: Colors.black,
        // 현재 선택된 아이템
        currentIndex: _selectedIndex,
        // 클릭 이벤트
        onTap: _onBtmItemClick,
      ),
    );
  }

  /// 클릭 이벤트
  /// @param index 클릭 아이템
  void _onBtmItemClick(int index) {
    switch (index) {
      case 2:
        _openCamera();
        break;
      default:
        // extends State<> 안에서만 사용 가능
        setState(() {
          _selectedIndex = index;
        });
        break;
    }
  }

  void _openCamera() async {
    if (await checkIfPermissionGranted(context))
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => CameraScreen()));
    else {
      SnackBar snackbar = SnackBar(
        content: Text("사진, 파일, 마이크 허용해주세요."),
        action: SnackBarAction(
          label: "OK",
          onPressed: () {
            _key.currentState.hideCurrentSnackBar();
            AppSettings.openLocationSettings();
          },
        ),
      );
      _key.currentState..showSnackBar(snackbar);
    }
  }

  Future<bool> checkIfPermissionGranted(BuildContext context) async {
    Map<Permission, PermissionStatus> statues = await [
      Permission.camera,
      Permission.microphone,
      Platform.isIOS ? Permission.photos : Permission.storage,
    ].request();
    bool permitted = true;
    statues.forEach((permission, permissionStatus) {
      if (!permissionStatus.isGranted) permitted = false;
    });
    return permitted;
  }
}
