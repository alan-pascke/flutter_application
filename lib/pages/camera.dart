import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/pages/widgets/camera_overlay.dart';

class OpenCamera extends StatefulWidget {
  const OpenCamera({Key? key}) : super(key: key);

  @override
  _OpenCameraState createState() => _OpenCameraState();
}

class _OpenCameraState extends State<OpenCamera> {
  List<CameraDescription> cameras = [];
  CameraController? controller;
  XFile? imagem;

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    _loadcameras();
  }

  void _loadcameras() async {
    try {
      cameras = await availableCameras();
      _startCamera();
    } on CameraException catch (e) {
      print(e.description);
    }
  }

  _startCamera() {
    if (cameras.isEmpty) {
      print('Camera não foi encontrada');
    } else {
      _previewCamera(cameras.last);
    }
  }

  _previewCamera(CameraDescription camera) async {
    final CameraController cameraController = CameraController(
      camera,
      ResolutionPreset.high,
      enableAudio: false,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );
    controller = cameraController;

    try {
      await cameraController.initialize();
    } on CameraException catch (e) {
      print(e.description);
    }

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    // size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reconhecimento Facial'),
        centerTitle: true,
        backgroundColor: Colors.green[700],
      ),
      body: Container(
        color: Colors.black,
        child: Center(
          child: _arquivoWidget(),
        ),
      ),
      floatingActionButton: (imagem != null)
          ? FloatingActionButton.extended(
              onPressed: () => Navigator.pop(context),
              label: const Text('Finalizar'),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  _arquivoWidget() {
    return Container(
      height: MediaQuery.of(context).size.height,
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height * .04,
          left: MediaQuery.of(context).size.height * .01,
          right: MediaQuery.of(context).size.height * .01),
      child: imagem == null
          ? _cameraPreviewWidget()
          : Image.file(File(imagem!.path), fit: BoxFit.contain),
    );
  }

  _cameraPreviewWidget() {
    final CameraController? cameraController = controller;
    if (cameraController == null || !cameraController.value.isInitialized) {
      return const Text('Widget para a camera não está disponivel');
    } else {
      return AspectRatio(
        aspectRatio: controller!.value.aspectRatio,
        child: SizedBox(
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              CameraPreview(controller!),
              cameraOverlay(padding: 50, aspectRatio: 1),
              _botaoCapturaWidget(),
            ],
          ),
        ),
      );
    }
  }

  _botaoCapturaWidget() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: CircleAvatar(
          radius: 32,
          backgroundColor: Colors.black.withOpacity(.5),
          child: IconButton(
            icon: const Icon(Icons.camera_alt),
            color: Colors.white,
            iconSize: 30,
            onPressed: () {
              takePicture();
            },
          ),
        ),
      ),
    );
  }

  takePicture() async {
    final CameraController? cameraController = controller;
    if (cameraController != null && cameraController.value.isInitialized) {
      try {
        XFile file = await cameraController.takePicture();
        if (mounted) {
          setState(() {
            imagem = file;
          });
        }
      } on CameraException catch (e) {
        print(e.description);
      }
    }
  }
}
