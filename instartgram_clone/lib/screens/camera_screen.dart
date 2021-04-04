import 'package:flutter/material.dart';
import 'package:instartgram_clone/screens/profile_screen.dart';
import 'package:instartgram_clone/widgets/TakePhoto.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  int _currentIndex = 1;
  PageController _pageController = PageController(initialPage: 1);
  String _title = "사진";

  @override
  void dispose() {
    /// 메모리 낭비 방지
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: PageView(
        controller: _pageController,
        children: [
          Container(
            color: Colors.blue,
          ),
          TakePhoto(),
          Container(
            color: Colors.greenAccent,
          ),
        ],
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
            switch (_currentIndex) {
              case 0:
                _title = "사진첩";
                break;
              case 1:
                _title = "사진";
                break;
              case 2:
                _title = "비디오";
                break;
            }
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 0,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        selectedItemColor: Colors.black,
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedItemColor: Colors.black54,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit), title: Text("사진첩")),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), title: Text("사진")),
          BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit), title: Text("비디오")),
        ],
        currentIndex: _currentIndex,
        onTap: _onItemTabbed,
      ),
    );
  }

  void _onItemTabbed(index) {
    setState(() {
      _currentIndex = index;
      _pageController.animateToPage(_currentIndex,
          duration: duration, curve: Curves.fastOutSlowIn);
    });
  }
}