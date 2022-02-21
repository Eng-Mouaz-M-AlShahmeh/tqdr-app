// Developed by: Eng Mouaz M. Al-Shahmeh
import 'package:flutter/material.dart';
import 'package:tqdr/styles/theme.dart';

ButtonStyle buttonSubmit = ButtonStyle(
  shape:
      MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20.0),
  )),
  foregroundColor: MaterialStateProperty.all(Colors.white),
  backgroundColor: MaterialStateProperty.all(appTheme.primaryColor),
  textStyle: MaterialStateProperty.all(
    const TextStyle(
      fontFamily: 'Cairo',
      fontSize: 14,
      color: Colors.white,
    ),
  ),
);

ButtonStyle buttonCancel = ButtonStyle(
  shape:
      MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20.0),
  )),
  foregroundColor: MaterialStateProperty.all(Colors.white),
  backgroundColor: MaterialStateProperty.all(buttonColorRegular),
  textStyle: MaterialStateProperty.all(
    const TextStyle(
      fontFamily: 'Cairo',
      fontSize: 14,
      color: Colors.white,
    ),
  ),
);
