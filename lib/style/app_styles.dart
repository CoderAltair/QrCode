import 'package:flutter/material.dart';

class AppStyles {
  static TextStyle style1() {
    return const TextStyle(
        fontSize: 17.0, fontWeight: FontWeight.w500, color: Colors.black);
  }

  static TextStyle style2() {
    return const TextStyle(
        fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black);
  }

  static TextStyle style3() {
    return const TextStyle(
        fontSize: 20.0, fontWeight: FontWeight.w600, color: Colors.black);
  }

  static ButtonStyle elevatedButtonStyle1() {
    return ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      backgroundColor: Colors.white,
      side: const BorderSide(width: 1, color: Colors.black),
    );
  }
}
