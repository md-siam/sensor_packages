import 'dart:developer';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class MyCamera extends StatelessWidget {
  const MyCamera({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Launch Camera'),
          onPressed: () async {
            try {
              await availableCameras().then(
                (value) => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CameraPage(cameras: value),
                  ),
                ),
              );
            } catch (e) {
              log(e.toString());
            }
          },
        ),
      ),
    );
  }
}

class CameraPage extends StatefulWidget {
  final List<CameraDescription>? cameras;

  const CameraPage({Key? key, this.cameras}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController controller;
  int chosenCamera = 0;
  XFile? pictureFile;

  @override
  void initState() {
    super.initState();
    controller = CameraController(
      widget.cameras![chosenCamera], // it will choose the first camera
      ResolutionPreset.max, // max resolution
    );
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return const SizedBox(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      body: SingleChildScrollView(
        controller: null,
        child: Column(
          children: [
            const SizedBox(height: 40),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: SizedBox(
                  height: 450,
                  width: 300,
                  child: CameraPreview(controller),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                pictureFile = await controller.takePicture();
                setState(() {});
              },
              child: const Text('Capture Image'),
            ),

            if (pictureFile != null)
              // Android/iOS
              Image.file(File(pictureFile!.path))

            // for web
            //Image.network(pictureFile!.path, height: 200)
          ],
        ),
      ),
    );
  }
}
