import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:instartgram_clone/constants/screen_size.dart';
import 'package:instartgram_clone/models/camera_state.dart';
import 'package:instartgram_clone/screens/share_post_screen.dart';
import 'package:instartgram_clone/widgets/my_progress_indicator.dart';
import 'package:provider/provider.dart';

class TakePhoto extends StatefulWidget {
  const TakePhoto({
    Key key,
  }) : super(key: key);

  @override
  _TakePhotoState createState() => _TakePhotoState();
}

class _TakePhotoState extends State<TakePhoto> {
  Widget _progress = MyProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (BuildContext context, CameraState cameraState, Widget child) {
      return Column(children: [
        Container(
          width: size.width,
          height: size.width,
          child:
              cameraState.readyTakePhoto ? _getPreview(cameraState) : _progress,
        ),
        Expanded(
            child: OutlineButton(
          onPressed: () {
            if (cameraState.readyTakePhoto)
              _attemptTakePhoto(context, cameraState);
          },
          shape: CircleBorder(),
          borderSide: BorderSide(color: Colors.black12, width: 20),
        ))
      ]);
    });
  }
}

Widget _getPreview(CameraState cameraState) {
  return ClipRect(
    child: OverflowBox(
      alignment: Alignment.center,
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Container(
            width: size.width,
            height: size.width / cameraState.controller.value.aspectRatio,
            child: CameraPreview(cameraState.controller)),
      ),
    ),
  );
}

void _attemptTakePhoto(BuildContext context, CameraState cameraState) async {
  try {
    XFile pictureTaken = await cameraState.controller.takePicture();
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => SharePostScreen(pictureTaken)));
  } catch (e) {}
}
