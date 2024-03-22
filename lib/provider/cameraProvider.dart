import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraProvider extends ChangeNotifier {
  CameraDescription? _camera;

  CameraDescription? get camera => _camera;

  void setCamera(CameraDescription camera) {
    _camera = camera;
    notifyListeners();
  }
}
