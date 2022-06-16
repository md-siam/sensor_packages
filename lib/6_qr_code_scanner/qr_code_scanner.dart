import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class MyQRCodeScanner extends StatefulWidget {
  const MyQRCodeScanner({Key? key}) : super(key: key);

  @override
  State<MyQRCodeScanner> createState() => _MyQRCodeScannerState();
}

class _MyQRCodeScannerState extends State<MyQRCodeScanner> {
  QRViewController? qrController;
  Barcode? qrBarcode;
  final qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void dispose() {
    qrController!.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await qrController!.pauseCamera();
    }
    qrController!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code Scanner'),
        centerTitle: true,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          buildQrView(context),
          Positioned(bottom: 10, child: buildResult()),
          Positioned(top: 10, child: buildControlButton()),
        ],
      ),
    );
  }

  Widget buildQrView(BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderWidth: 10,
        borderLength: 20,
        borderRadius: 10,
        borderColor: Colors.deepPurple,
        cutOutSize: MediaQuery.of(context).size.width * 0.8,
      ),
    );
  }

  void onQRViewCreated(QRViewController controller) {
    setState(() {
      qrController = controller;
    });
    controller.scannedDataStream.listen((barcode) {
      return setState(() {
        qrBarcode = barcode;
      });
    });
  }

  Widget buildResult() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white30,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        qrBarcode != null ? 'Result : ${qrBarcode!.code}' : 'Scan a code!',
        maxLines: 3,
      ),
    );
  }

  Widget buildControlButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white30,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            icon: FutureBuilder<bool?>(
              future: qrController?.getFlashStatus(),
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  return Icon(
                    snapshot.data! ? Icons.flash_on : Icons.flash_off,
                  );
                } else {
                  return Container();
                }
              },
            ),
            onPressed: () async {
              await qrController?.toggleFlash();
              setState(() {});
            },
          ),
          IconButton(
            icon: FutureBuilder(
              future: qrController?.getCameraInfo(),
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  return const Icon(Icons.switch_camera);
                } else {
                  return Container();
                }
              },
            ),
            onPressed: () async {
              await qrController?.flipCamera();
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
