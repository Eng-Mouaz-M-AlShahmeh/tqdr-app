// Developed by: Eng Mouaz M. Al-Shahmeh
import 'package:flutter/material.dart';

Future<bool> returnHome(BuildContext context) async {
  Navigator.pushReplacementNamed(
    context,
    '/home',
  );
  return false;
}
