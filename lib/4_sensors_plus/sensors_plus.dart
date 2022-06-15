import 'package:flutter/material.dart';

import 'views/accelerometer.dart';
import 'views/gyroscope.dart';
import 'views/magnetometer.dart';

class MySensorsPlus extends StatelessWidget {
  const MySensorsPlus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );

    /// Learn the basics of different types of sensors from this
    /// video: [https://www.youtube.com/watch?v=7DELJMW2ZW0]
    ///
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sensors Plus'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyAccelerometer()));
              },
              child: Text('Accelerometer', style: textStyle),
            ),
            const SizedBox(height: 40.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyGyroscope()));
              },
              child: Text('Gyroscope', style: textStyle),
            ),
            const SizedBox(height: 40.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyMagnetometer()));
              },
              child: Text('Magnetometer', style: textStyle),
            ),
          ],
        ),
      ),
    );
  }
}
