import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instartgram_clone/widgets/post.dart';

class feedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        leading: IconButton(
          onPressed: null,
          icon: Icon(
            CupertinoIcons.camera,
            color: Colors.black87,
          ),
        ),
        middle: Text(
          "Instagram",
          style: TextStyle(fontFamily: "VeganStyle", color: Colors.black87),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
                icon: ImageIcon(
                  AssetImage('images/actionbar_camera.png'),
                  color: Colors.black87,
                ),
                onPressed: null)
          ],
        ),
      ),
      body: ListView.builder(itemBuilder: feedListBuilder, itemCount: 30),
    );
  }

  Widget feedListBuilder(BuildContext context, int index) {
    return Post(index);
  }
}
