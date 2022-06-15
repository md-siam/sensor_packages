import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class MyMagnetometer extends StatefulWidget {
  const MyMagnetometer({Key? key}) : super(key: key);

  @override
  State<MyMagnetometer> createState() => _MyMagnetometerState();
}

class _MyMagnetometerState extends State<MyMagnetometer> {
  String? x;
  String? y;
  String? z;
  TextStyle textStyle = const TextStyle(fontSize: 20);

  @override
  void initState() {
    super.initState();
    // [MagnetometerEvent (x: -23.6, y: 6.2, z: -34.9)]
    magnetometerEvents.listen((MagnetometerEvent event) {
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
        title:
            const Text('Magnetometer'), // Magnetometer detects magnetic forces
        centerTitle: true, //         i.e x(East), y(north), & z(up / center)
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
                  backgroundColor: Colors.blueGrey[300],
                  child: const Text(
                    'Magnetometer\nEvent in\ntesla (T)',
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
