import 'package:flutter/material.dart'; // android material design

/// 홈페이지
class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  /// 상태 변화 생길때 마다 재 생성
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<BottomNavigationBarItem> btmNavItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.add), label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.healing), label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: ''),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Scaffold 기본적인 위젯 모음
    return Scaffold(
      body: Container(
        color: Colors.amber,
      ),
      bottomNavigationBar: BottomNavigationBar(
        // 선택된 아이콘의 레이블
        showSelectedLabels: false,
        // 선택 안된 아이콘의 레이블
        showUnselectedLabels: false,
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
    print(index);

    // extends State<> 안에서만 사용 가능
    setState(() {
      _selectedIndex = index;
    });
  }
}
