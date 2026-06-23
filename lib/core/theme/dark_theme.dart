import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppDarkTheme {
  static ThemeData get theme {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor:
      AppColors.darkBackground,
    );
  }
}