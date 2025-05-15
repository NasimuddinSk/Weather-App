import 'package:flutter/material.dart';

import '../utils/app_color.dart';

class AppTheme {
  static final ThemeData theme = ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(backgroundColor: AppColor.primary),
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        fontSize: 25,
        color: AppColor.white,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(fontSize: 12, color: AppColor.white),
    ),
  );
}
