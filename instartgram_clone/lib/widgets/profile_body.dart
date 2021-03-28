import 'package:flutter/material.dart';
import 'package:instartgram_clone/constants/common_size.dart';
import 'package:instartgram_clone/constants/screen_size.dart';

class ProfileBody extends StatefulWidget {
  @override
  _ProfileBodyState createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  bool selectedLeft = true;

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
          ]))
        ],
      ),
    );
  }

  Widget _selectedIndicator() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      alignment: selectedLeft ? Alignment.centerLeft : Alignment.centerRight,
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
                  color: selectedLeft ? Colors.black : Colors.black26,
                ),
                onPressed: () {
                  setState(() {
                    selectedLeft = true;
                  });
                })),
        Expanded(
            child: IconButton(
                icon: ImageIcon(
                  AssetImage('assets/images/saved.png'),
                  color: selectedLeft ? Colors.black26 : Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    selectedLeft = false;
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
