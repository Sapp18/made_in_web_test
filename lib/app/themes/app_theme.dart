import 'package:flutter/material.dart';

import '../app.dart';

class AppTheme {
  static ThemeData darkMode = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: DarkTheme.background,
    appBarTheme: AppBarTheme(
      backgroundColor: DarkTheme.onPrimary,
      foregroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: AppStyle.w600(20),
    ),
    buttonTheme: ButtonThemeData(
      disabledColor: DarkTheme.buttonDisabled,
      buttonColor: DarkTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    cardTheme: const CardTheme(color: DarkTheme.onBackground),
    colorScheme: const ColorScheme.dark(
      //Primary
      primary: DarkTheme.primary,
      onPrimary: DarkTheme.onPrimary,
      primaryContainer: DarkTheme.primaryContainer,
      onPrimaryContainer: DarkTheme.onPrimaryContainer,
      //Secondary
      secondary: DarkTheme.secondary,
      onSecondary: DarkTheme.onSecondary,
      secondaryContainer: DarkTheme.secondaryContainer,
      onSecondaryContainer: DarkTheme.onSecondaryContainer,
      //Tertiary
      tertiary: DarkTheme.tertiary,
      onTertiary: DarkTheme.onTertiary,
      tertiaryContainer: DarkTheme.tertiaryContainer,
      onTertiaryContainer: DarkTheme.onTertiaryContainer,
      //Error
      error: DarkTheme.error,
      onError: DarkTheme.onError,
      errorContainer: DarkTheme.errorContainer,
      onErrorContainer: DarkTheme.onErrorContainer,
      //Surface
      surface: DarkTheme.surface,
      onSurface: DarkTheme.onSurface,
      surfaceVariant: DarkTheme.surfaceVariant,
      onSurfaceVariant: DarkTheme.onSurfaceVariant,
      surfaceTint: DarkTheme.surfaceTint,
      //Inverse
      inverseSurface: DarkTheme.inverseSurface,
      onInverseSurface: DarkTheme.inverseOnSurface,
      inversePrimary: DarkTheme.inversePrimary,
      //Background
      background: DarkTheme.background,
      onBackground: DarkTheme.onBackground,
      //Outline
      outline: DarkTheme.outline,
      outlineVariant: DarkTheme.outlineVariant,
      //Free
      scrim: DarkTheme.scrim,
      shadow: DarkTheme.shadow,
    ),
    dialogTheme: DialogTheme(
      backgroundColor: DarkTheme.onBackground,
      titleTextStyle: AppStyle.w500(20),
      contentTextStyle: AppStyle.w400(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(dialogRadius),
      ),
    ),
    dividerTheme: const DividerThemeData(color: Colors.transparent),
    drawerTheme: const DrawerThemeData(backgroundColor: DarkTheme.background),
    iconTheme: const IconThemeData(color: Colors.black),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: AppStyle.w400(16, DarkTheme.onSurfaceVariant),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(inputRadius),
        borderSide: const BorderSide(color: DarkTheme.outline),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(inputRadius),
        borderSide: const BorderSide(color: DarkTheme.primary),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(inputRadius),
        borderSide: const BorderSide(color: DarkTheme.error),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(inputRadius),
        borderSide: const BorderSide(color: DarkTheme.onError),
      ),
    ),
  );

  static ThemeData lightMode = ThemeData.light().copyWith(
    brightness: Brightness.light,
    scaffoldBackgroundColor: LightTheme.background,
    appBarTheme: AppBarTheme(
      backgroundColor: LightTheme.onPrimary,
      foregroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: AppStyle.w600(20),
    ),
    buttonTheme: ButtonThemeData(
      disabledColor: LightTheme.buttonDisabled,
      buttonColor: LightTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    cardTheme: const CardTheme(color: LightTheme.onBackground),
    colorScheme: const ColorScheme.light(
      //Primary
      primary: LightTheme.primary,
      onPrimary: LightTheme.onPrimary,
      primaryContainer: LightTheme.primaryContainer,
      onPrimaryContainer: LightTheme.onPrimaryContainer,
      //Secondary
      secondary: LightTheme.secondary,
      onSecondary: LightTheme.onSecondary,
      secondaryContainer: LightTheme.secondaryContainer,
      onSecondaryContainer: LightTheme.onSecondaryContainer,
      //Tertiary
      tertiary: LightTheme.tertiary,
      onTertiary: LightTheme.onTertiary,
      tertiaryContainer: LightTheme.tertiaryContainer,
      onTertiaryContainer: LightTheme.onTertiaryContainer,
      //Error
      error: LightTheme.error,
      onError: LightTheme.onError,
      errorContainer: LightTheme.errorContainer,
      onErrorContainer: LightTheme.onErrorContainer,
      //Surface
      surface: LightTheme.surface,
      onSurface: LightTheme.onSurface,
      surfaceVariant: LightTheme.surfaceVariant,
      onSurfaceVariant: LightTheme.onSurfaceVariant,
      surfaceTint: LightTheme.surfaceTint,
      //Inverse
      inverseSurface: LightTheme.inverseSurface,
      onInverseSurface: LightTheme.inverseOnSurface,
      inversePrimary: LightTheme.inversePrimary,
      //Background
      background: LightTheme.background,
      onBackground: LightTheme.onBackground,
      //Outline
      outline: LightTheme.outline,
      outlineVariant: LightTheme.outlineVariant,
      //Free
      scrim: LightTheme.scrim,
      shadow: LightTheme.shadow,
    ),
    dialogTheme: DialogTheme(
      backgroundColor: LightTheme.onBackground,
      titleTextStyle: AppStyle.w500(20, Colors.black),
      contentTextStyle: AppStyle.w400(16, Colors.black),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(dialogRadius),
      ),
    ),
    dividerTheme: const DividerThemeData(color: Colors.transparent),
    drawerTheme: const DrawerThemeData(backgroundColor: LightTheme.background),
    iconTheme: const IconThemeData(color: Colors.black),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: AppStyle.w400(16, LightTheme.onSurfaceVariant),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(inputRadius),
        borderSide: const BorderSide(color: LightTheme.outline),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(inputRadius),
        borderSide: const BorderSide(color: LightTheme.primary),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(inputRadius),
        borderSide: const BorderSide(color: LightTheme.error),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(inputRadius),
        borderSide: const BorderSide(color: LightTheme.onError),
      ),
    ),
  );
}
