import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraState extends ChangeNotifier {
  CameraController _controller;
  CameraDescription _cameraDescription;
  bool _readyTakePhoto = false;

  CameraController get controller => _controller;

  CameraDescription get cameraDescription => _cameraDescription;

  bool get readyTakePhoto => _readyTakePhoto;

  // 메모리 누수 방지
  void dispose() {
    if (_controller != null) _controller.dispose();
    _controller = null;
    _cameraDescription = null;
    _readyTakePhoto = false;
    notifyListeners();
  }

  void getReadyToTakePhoto() async {
    // 사용자가 가진 카메라를 목록으로 받아오
    List<CameraDescription> cameras = await availableCameras();

    if (cameras != null && cameras.isNotEmpty) setCameraDescription(cameras[0]);

    bool init = false;
    while (!init) {
      init = await initialize();
    }
    _readyTakePhoto = true;
    notifyListeners();
  }

  void setCameraDescription(CameraDescription cameraDescription) {
    _cameraDescription = cameraDescription;
    _controller = CameraController(_cameraDescription, ResolutionPreset.medium);
  }

  Future<bool> initialize() async {
    try {
      await _controller.initialize();
      return true;
    } catch (e) {
      return false;
    }
  }
}
