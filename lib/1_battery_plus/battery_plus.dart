import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:battery_plus/battery_plus.dart';

class MyBatteryPlus extends StatefulWidget {
  const MyBatteryPlus({Key? key}) : super(key: key);

  @override
  State<MyBatteryPlus> createState() => _MyBatteryPlusState();
}

class _MyBatteryPlusState extends State<MyBatteryPlus> {
  var batteryLabel = 0;
  final Battery _battery = Battery();

  printBatteryLevel(Battery battery) async {
    try {
      batteryLabel = await battery.batteryLevel;
      setState(() {});
      print('Battery Level: $batteryLabel');
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Battery Plus')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(batteryLabel.toString()),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                printBatteryLevel(_battery);
              },
              child: const Text('Press'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  batteryLabel = 0;
                });
              },
              child: const Text('Reset'),
            )
          ],
        ),
      ),
    );
  }
}
