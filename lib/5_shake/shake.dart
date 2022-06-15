import 'package:flutter/material.dart';
import 'package:shake/shake.dart';

import 'quotes.dart';

class MyShake extends StatefulWidget {
  const MyShake({Key? key}) : super(key: key);

  @override
  State<MyShake> createState() => _MyShakeState();
}

class _MyShakeState extends State<MyShake> {
  String quote = quotes.first;
  int shakeCount = 0;
  late ShakeDetector detector;

  @override
  void initState() {
    super.initState();
    detector = ShakeDetector.autoStart(onPhoneShake: () {
      final newQuotes = (List.of(quotes)
            ..remove(quote)
            ..shuffle())
          .first;
      setState(() {
        quote = newQuotes;
        shakeCount = detector.mShakeCount;
      });
    });
  }

  @override
  void dispose() {
    detector.stopListening();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        title: const Text('Shake'),
        centerTitle: true,
        backgroundColor: Colors.black38,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Text(
              'Shake Count: $shakeCount',
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50),
            CircleAvatar(
              radius: 180,
              backgroundColor: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  quote,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
