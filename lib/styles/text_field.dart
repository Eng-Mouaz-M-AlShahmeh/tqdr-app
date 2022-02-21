// Developed by: Eng Mouaz M. Al-Shahmeh
import 'package:flutter/material.dart';
import 'package:tqdr/styles/theme.dart';

InputDecoration textInputDecoration = InputDecoration(
  labelStyle: appTheme.textTheme.headline5,
  errorStyle: appTheme.textTheme.headline6,
  hintText: '',
  hintStyle: appTheme.textTheme.headline5,
  fillColor: Colors.white,
  filled: true,
  enabledBorder: const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
    borderSide: BorderSide(
      color: Colors.white,
      width: 1.0,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
    borderSide: BorderSide(
      color: appTheme.primaryColor,
      width: 1.0,
    ),
  ),
  // constraints: const BoxConstraints(
  //   minHeight: 45,
  //   maxHeight: 45,
  // ),
);
