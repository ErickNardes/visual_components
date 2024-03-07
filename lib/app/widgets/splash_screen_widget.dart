import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:visual_components/app/my_app.dart';

class SplashScreenWidget extends StatefulWidget {
  const SplashScreenWidget({super.key});

  @override
  State<SplashScreenWidget> createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.yellow, Colors.black],
                stops: [0.7, 0.9])),
        child: Center(
            child: AnimatedTextKit(
          onFinished: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return MyAppPage();
            }));
          },
          animatedTexts: [
            TypewriterAnimatedText(
              'Hello world!',
              textStyle: const TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
              speed: const Duration(milliseconds: 500),
            ),
          ],
          totalRepeatCount: 1,
          pause: const Duration(milliseconds: 500),
          displayFullTextOnTap: true,
          stopPauseOnTap: true,
        )),
      ),
    );
  }
}
