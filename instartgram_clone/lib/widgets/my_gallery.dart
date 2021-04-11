import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:instartgram_clone/models/gallery_state.dart';
import 'package:instartgram_clone/screens/share_post_screen.dart';
import 'package:local_image_provider/device_image.dart';
import 'package:provider/provider.dart';

class MyGallery extends StatefulWidget {
  @override
  _MyGalleryState createState() => _MyGalleryState();
}

class _MyGalleryState extends State<MyGallery> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, GalleryState galleryState, Widget child) {
        return GridView.count(
            crossAxisCount: 3, children: getImages(context, galleryState));
      },
    );
  }

  List<Widget> getImages(BuildContext context, GalleryState state) {
    return state.images
        .map((localImage) => InkWell(
              onTap: () async {
                Uint8List bytes = await localImage.getScaledImageBytes(
                    state.localImageProvider, 0.3);

                try {
                  XFile imageFile = XFile.fromData(bytes);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => SharePostScreen(imageFile)));
                } catch (e) {}
              },
              child: Image(
                image: DeviceImage(localImage, scale: 0.2),
                fit: BoxFit.cover,
              ),
            ))
        .toList();
  }
}
