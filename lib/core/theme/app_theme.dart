import 'package:flutter/material.dart';

final appTheme = ThemeData(
  primarySwatch: Colors.blue,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.black
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      color: Colors.green,
    ),
    labelSmall: TextStyle(
      color: Colors.white,
      fontSize: 10,
    ),
  ),
  extensions: const <ThemeExtension<dynamic>>[
    AppColors(
      cardBackground: Color(0xFFF5F5F5),
      addIconColor: Colors.blue,
      bageColor: Colors.red,
    ),
  ],
);

class AppColors extends ThemeExtension<AppColors> {
  final Color cardBackground;
  final Color addIconColor;
  final Color bageColor;

  const AppColors({
    required this.cardBackground,
    required this.addIconColor,
    required this.bageColor
  });

  @override
  ThemeExtension<AppColors> copyWith({
    Color? cardBackground,
    Color? addIconColor,
    Color? bageColor,
  }) {
    return AppColors(
      cardBackground: cardBackground ?? this.cardBackground,
      addIconColor: addIconColor ?? this.addIconColor,
      bageColor: bageColor ?? this.bageColor,
    );
  }

  @override
  ThemeExtension<AppColors> lerp(
      ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      cardBackground: Color.lerp(
          cardBackground, other.cardBackground, t) ?? cardBackground,
      addIconColor: Color.lerp(
          addIconColor, other.addIconColor, t) ?? addIconColor,
      bageColor: Color.lerp(
          bageColor, other.bageColor, t) ?? bageColor
    );
  }
}