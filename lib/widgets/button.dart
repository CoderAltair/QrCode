import 'package:flutter/material.dart';
import '../qr_code/qr_scanner.dart';

class QrButton {
  static Widget qrcode(var context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Colors.white,
        side: const BorderSide(width: 1, color: Colors.black),
      ),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => (const QrScanner()),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Center(
              child: Text(
                'Scaner',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
            Icon(
              Icons.qr_code_scanner,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
