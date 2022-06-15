import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class MyAccelerometer extends StatefulWidget {
  const MyAccelerometer({Key? key}) : super(key: key);

  @override
  State<MyAccelerometer> createState() => _MyAccelerometerState();
}

class _MyAccelerometerState extends State<MyAccelerometer> {
  String? x;
  String? y;
  String? z;
  TextStyle textStyle = const TextStyle(fontSize: 20);

  @override
  void initState() {
    super.initState();
    // [UserAccelerometerEvent (x: 0.0, y: 0.0, z: 0.0)]
    userAccelerometerEvents.listen((UserAccelerometerEvent event) {
      //print(event);

      setState(() {
        x = (event.x).toStringAsFixed(2);
        y = (event.y).toStringAsFixed(2);
        z = (event.z).toStringAsFixed(2);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accelerometer'), // Accelerometer detects movement
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.blue[300],
                  child: const Text(
                    'Accelerometer\nEvent in\nm/s^2 (g)',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 200),
                  child: Text('z: $z', style: textStyle),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('y: $y', style: textStyle),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text('x: $x', style: textStyle),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
