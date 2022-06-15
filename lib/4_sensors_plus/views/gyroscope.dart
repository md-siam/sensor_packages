import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class MyGyroscope extends StatefulWidget {
  const MyGyroscope({Key? key}) : super(key: key);

  @override
  State<MyGyroscope> createState() => _MyGyroscopeState();
}

class _MyGyroscopeState extends State<MyGyroscope> {
  String? x;
  String? y;
  String? z;
  TextStyle textStyle = const TextStyle(fontSize: 20);

  @override
  void initState() {
    super.initState();
    // [GyroscopeEvent (x: 0.0, y: 0.0, z: 0.0)]
    gyroscopeEvents.listen((GyroscopeEvent event) {
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
        title: const Text('Gyroscope'), // Gyroscope detects rotation
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
                  backgroundColor: Colors.green[300],
                  child: const Text(
                    'Gyroscope\nEvent in\ndeg/s (°/s)',
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
