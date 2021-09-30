import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final get = ThemeData(
    primaryColor: ColorsTheme.primaryColor,
  );
}

class ColorsTheme {
  ColorsTheme._();

  static const primaryColor = Color(0xFFFFFFFF);
}
