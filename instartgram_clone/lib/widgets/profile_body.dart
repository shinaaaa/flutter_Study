import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instartgram_clone/constants/common_size.dart';
import 'package:instartgram_clone/constants/screen_size.dart';

class ProfileBody extends StatefulWidget {
  @override
  _ProfileBodyState createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  SelectedTab _selectedTab = SelectedTab.left;
  double _leftImagesPageMargin = 0;
  double _rightImagesPageMargin = size.width;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            _username(),
            _userBio(),
            _editProfileButton(),
            _tabButtons(),
            _selectedIndicator(),
          ])),
          _imagesPager()
        ],
      ),
    );
  }

  SliverToBoxAdapter _imagesPager() {
    return SliverToBoxAdapter(
        // shrinkWrap => true 내용물 만큼 자리 차지
        // physics => 이중 스크롤 방지
        child: Stack(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 300),
          transform: Matrix4.translationValues(_leftImagesPageMargin, 0, 0),
          curve: Curves.fastOutSlowIn,
          child: _images(),
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 300),
          transform: Matrix4.translationValues(_rightImagesPageMargin, 0, 0),
          curve: Curves.fastOutSlowIn,
          child: _images(),
        ),
      ],
    ));
  }

  GridView _images() {
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 3,
      childAspectRatio: 1,
      children: List.generate(
          30,
          (index) => CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: "https://picsum.photos/id/$index/100/100")),
    );
  }

  Widget _selectedIndicator() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      alignment: _selectedTab == SelectedTab.left
          ? Alignment.centerLeft
          : Alignment.centerRight,
      child: Container(
        height: 3,
        width: size.width / 2,
        color: Colors.black87,
      ),
      curve: Curves.easeInOut,
    );
  }

  Row _tabButtons() {
    return Row(
      children: [
        Expanded(
            child: IconButton(
                icon: ImageIcon(
                  AssetImage('assets/images/grid.png'),
                  color: _selectedTab == SelectedTab.left
                      ? Colors.black
                      : Colors.black26,
                ),
                onPressed: () {
                  setState(() {
                    _selectedTab = SelectedTab.left;
                    _leftImagesPageMargin = 0;
                    _rightImagesPageMargin = size.width;
                  });
                })),
        Expanded(
            child: IconButton(
                icon: ImageIcon(
                  AssetImage('assets/images/saved.png'),
                  color: _selectedTab == SelectedTab.left
                      ? Colors.black26
                      : Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    _selectedTab = SelectedTab.right;
                    _leftImagesPageMargin = -size.width;
                    _rightImagesPageMargin = 0;
                  });
                }))
      ],
    );
  }

  Widget _username() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: common_gap),
      child: Text(
        "username",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

Widget _userBio() {
  return Padding(
    padding: const EdgeInsets.only(
        left: common_gap, right: common_gap, bottom: common_gap),
    child: Text(
      "This is what I believe",
      style: TextStyle(
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}

Padding _editProfileButton() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: common_gap),
    child: SizedBox(
      height: 24,
      child: OutlineButton(
        onPressed: () {},
        borderSide: BorderSide(color: Colors.black54),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          "Edit Profile",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}

enum SelectedTab { left, right }
