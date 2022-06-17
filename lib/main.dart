// Copyright (c) 2022, Md. Siam
// http://mdsiam.xyz/
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://choosealicense.com/licenses/mit/

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'routes.dart';

void main() {
  /// This code is for [disabling] the landscape orientation
  ///
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sensor Packages',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      //home: const MyBatteryPlus(),
      //home: const MyWakelock(),
      //home: const MyLocalAuth(),
      //home: const MySensorsPlus(),
      //home: const MyShake(),
      //home: const MyQRCodeScanner(),
      home: const MyCamera(),
    );
  }
}
