import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../style/app_styles.dart';


class QrScanner extends StatefulWidget {
  const QrScanner({super.key});

  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Qr Code Scaner',
          style: AppStyles.style1(),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        child: Column(
          children: [
            Expanded(
                child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            )),
            Expanded(
              child: Center(
                child: (result != null)
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Data:${result!.code}',
                            style: AppStyles.style1(),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Barcode Type: ${describeEnum(result!.format)}',
                            style: AppStyles.style1(),
                          )
                        ],
                      )
                    : Text(
                        'Scan a code',
                        style: AppStyles.style2(),
                      ),
              ),
            ),
            ElevatedButton(
              style: AppStyles.elevatedButtonStyle1(),
              onPressed: () {},
              child: Text(
                'Scaner',
                style: AppStyles.style1(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
