import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:battery_plus/battery_plus.dart';

class MyBatteryPlus extends StatefulWidget {
  const MyBatteryPlus({Key? key}) : super(key: key);

  @override
  State<MyBatteryPlus> createState() => _MyBatteryPlusState();
}

class _MyBatteryPlusState extends State<MyBatteryPlus> {
  var batteryLevel = 0;
  final Battery _battery = Battery();

  printBatteryLevel() async {
    try {
      batteryLevel = await _battery.batteryLevel;
      setState(() {});
      debugPrint('Battery Level: $batteryLevel');
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Battery Plus'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              alignment: Alignment.center,
              color: Colors.deepPurple[100],
              child: Text(
                batteryLevel.toString(),
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => printBatteryLevel(),
              child: const Text('Press'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => setState(() {
                batteryLevel = 0;
              }),
              child: const Text('Reset'),
            )
          ],
        ),
      ),
    );
  }
}
