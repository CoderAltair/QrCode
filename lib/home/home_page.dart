import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../style/app_styles.dart';
import '../widgets/button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(
            height: 40,
          ),
          const Center(
            child: Text(
              'Qr Code Scanner',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            height: 300,
            decoration: const BoxDecoration(),
            child: const Image(image: AssetImage('images/qr.PNG')),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70.0),
                child: SizedBox(
                  width: 150.0,
                  height: 50.0,
                  child: QrButton.qrcode(context),
                ),
              ),
              Container(
                decoration: const BoxDecoration(),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.1,
                child: Center(
                  child: AnimatedTextKit(
                    animatedTexts: [
                      ScaleAnimatedText(
                        'Scan',
                        textStyle: AppStyles.style3(),
                      ),
                    ],
                    totalRepeatCount: 4,
                    pause: const Duration(milliseconds: 400),
                    displayFullTextOnTap: true,
                    stopPauseOnTap: true,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
