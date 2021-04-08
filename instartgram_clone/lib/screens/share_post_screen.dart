import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class SharePostScreen extends StatelessWidget {
  final XFile imageFile;

  const SharePostScreen(this.imageFile, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.file(File(imageFile.path));
  }
}
