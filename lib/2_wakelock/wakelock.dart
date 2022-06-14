import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wakelock/wakelock.dart';

class MyWakelock extends StatefulWidget {
  const MyWakelock({Key? key}) : super(key: key);

  @override
  State<MyWakelock> createState() => _MyWakelockState();
}

class _MyWakelockState extends State<MyWakelock> {
  Timer? _timer;
  int _start = 15;
  bool wakeLockEnabled = false;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wakelock'),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _start.toString(),
                    style: const TextStyle(
                      fontSize: 100,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Is WakeLock enabled?: $wakeLockEnabled',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // For starting the timer function
                startTimer();
                // The following line will enable the Android and iOS wakelock.
                Wakelock.enable();
                setState(() {
                  wakeLockEnabled = true;
                });
              },
              child: const Text('Enable WakeLock'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // For starting the timer function
                startTimer();
                // This line disables the wakelock again.
                Wakelock.disable();
                setState(() {
                  wakeLockEnabled = false;
                });
              },
              child: const Text('Disable WakeLock'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _start = 15;
                });
              },
              child: const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  '↺ Reset Timer',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
