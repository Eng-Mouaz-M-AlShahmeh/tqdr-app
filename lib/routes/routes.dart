// Developed by: Eng Mouaz M. Al-Shahmeh
import 'package:flutter/material.dart';
import 'package:tqdr/screens/home/about.dart';
import 'package:tqdr/screens/home/faqs.dart';
import 'package:tqdr/screens/home/index.dart';
import 'package:tqdr/screens/home/join.dart';
import 'package:tqdr/screens/home/privacy.dart';
import 'package:tqdr/screens/home/service_providers.dart';
import 'package:tqdr/screens/home/stores.dart';
import 'package:tqdr/screens/home/terms.dart';
import 'package:tqdr/screens/payments/inquiry.dart';
import 'package:tqdr/screens/payments/link.dart';
import 'package:tqdr/screens/payments/link_pay.dart';
import 'package:tqdr/screens/payments/partner.dart';
import 'package:tqdr/screens/splash/index.dart';
import 'package:tqdr/screens/splash/successful.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/': (context) => const SplashScreen(),
  '/success': (context) => const SuccessSplashScreen(),
  '/home': (context) => HomeScreen(),
  '/home/about': (context) => AboutScreen(),
  '/home/privacy': (context) => PrivacyScreen(),
  '/home/terms': (context) => TermsScreen(),
  '/home/join': (context) => JoinScreen(),
  '/home/faqs': (context) => FaqsScreen(),
  '/home/servProvs': (context) => SPsScreen(),
  '/home/stores': (context) => StoresScreen(),
  '/payments/partner': (context) => PartnerPayScreen(),
  '/payments/link': (context) => LinkScreen(),
  '/payments/link/pay': (context) => LinkPayScreen(),
  '/payments/inquiry': (context) => FundsInquiryScreen(),

};
