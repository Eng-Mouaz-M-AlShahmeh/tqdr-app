/* Developed by: Eng Mouaz M. Al-Shahmeh */
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:tqdr/screens/home/index.dart';

class SuccessSplashScreen extends StatelessWidget {
  const SuccessSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1f2835),
      body: AnimatedSplashScreen(
        duration: 1500,
        splash: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage('assets/images/thanks.png'),
              fit: BoxFit.contain,
            ),
          ),
        ),
        nextScreen: HomeScreen(),
        splashTransition: SplashTransition.fadeTransition,
        splashIconSize: 700,
        backgroundColor: const Color(0xff001e72),
      ),

    );
  }
}
