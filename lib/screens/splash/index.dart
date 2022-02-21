// Developed by: Eng Mouaz M. Al-Shahmeh
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:tqdr/screens/home/index.dart';
import 'package:tqdr/states/app_provider.dart';
import 'package:tqdr/states/invoice_provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appProvider = context.read<AppProvider>();
    var invProvider = context.read<InvoiceProvider>();

    Future.delayed(const Duration(milliseconds: 0 ), () {
      invProvider.getStoresList(context);
      appProvider.getSPsList(context);
    });



    return Scaffold(
        backgroundColor: const Color(0xff1f2835),
        body: AnimatedSplashScreen(
          duration: 1500,
          splash: Container(
            width: 300,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage('assets/images/logo-w.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
          nextScreen: HomeScreen(),
          splashTransition: SplashTransition.fadeTransition,
          splashIconSize: 200,
          backgroundColor: const Color(0xff1f2835),
        ),
    );
  }
}
