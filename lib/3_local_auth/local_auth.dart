import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

import 'api/local_auth_api.dart';
import 'view/home_page.dart';
import 'widgets/build_button.dart';

class MyLocalAuth extends StatelessWidget {
  const MyLocalAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Local Auth'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildAvailability(context),
              const SizedBox(height: 24),
              buildAuthenticate(context),
            ],
          ),
        ),
      ),
    );
  }

  buildAvailability(BuildContext context) => buildButton(
        text: 'Check Availability',
        icon: Icons.event_available,
        onClicked: () async {
          final isAvailable = await LocalAuthApi.hasBiometrics();
          final biometrics = await LocalAuthApi.getBiometrics();

          final hasFingerprint = biometrics.contains(BiometricType.fingerprint);

          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Availability'),
              content: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  buildText('Biometrics', isAvailable),
                  buildText('Fingerprint', hasFingerprint),
                ],
              ),
            ),
          );
        },
      );

  buildAuthenticate(BuildContext context) => buildButton(
        text: 'Authenticate',
        icon: Icons.lock_open,
        onClicked: () async {
          final isAuthenticated = await LocalAuthApi.authenticate();

          if (isAuthenticated) {
            // ignore: use_build_context_synchronously
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          }
        },
      );

  buildText(String text, bool checked) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          checked
              ? const Icon(Icons.check, color: Colors.green, size: 20)
              : const Icon(Icons.close, color: Colors.red, size: 20),
          const SizedBox(width: 12),
          Text(text, style: const TextStyle(fontSize: 24)),
        ],
      ),
    );
  }
}
