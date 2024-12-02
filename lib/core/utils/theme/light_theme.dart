import 'package:base_project/core/utils/app_constance.dart';
import 'package:base_project/core/utils/app_extension.dart';
import 'package:base_project/core/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

abstract class LightTheme {
  const LightTheme._();
  static ThemeData init(BuildContext context) => ThemeData(
        useMaterial3: true,
        fontFamily: AppConstance.appFont,
        scaffoldBackgroundColor: AppColors.scaffoldLightThemeColor,
        colorScheme: colorScheme(),
        appBarTheme: appBarTheme(),
        inputDecorationTheme: inputDecorationTheme(),
        elevatedButtonTheme: elevatedButtonTheme(context),
        textButtonTheme: textButtonThemeData(),
        dialogTheme: dialogTheme(),
        bottomSheetTheme: bottomSheetTheme(),
        listTileTheme: listTileTheme(),
      );

  static ColorScheme colorScheme() => const ColorScheme.light(
        primary: AppColors.primaryColor,
        brightness: Brightness.light,
      );

  static AppBarTheme appBarTheme() => const AppBarTheme(
        backgroundColor: AppColors.scaffoldLightThemeColor,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontFamily: AppConstance.appFont,
        ),
        elevation: 0,
        scrolledUnderElevation: 0,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      );

  static InputDecorationTheme inputDecorationTheme() {
    const borderSide =
        BorderSide(color: AppColors.borderTextFieldColor, width: 1);
    final borderRadius = 24.radius;
    return InputDecorationTheme(
      filled: true,
      fillColor: AppColors.fillTextFieldColor,
      hintStyle: const TextStyle(
        color: Color(0xff9C9C9C),
        fontSize: 12,
      ),
      border: OutlineInputBorder(
        borderSide: borderSide,
        borderRadius: borderRadius,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: borderSide,
        borderRadius: borderRadius,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: borderSide,
        borderRadius: borderRadius,
      ),
    );
  }

  static ElevatedButtonThemeData elevatedButtonTheme(BuildContext ctx) =>
      ElevatedButtonThemeData(
        style: ButtonStyle(
          overlayColor: WidgetStateProperty.all(Colors.white.withOpacity(.2)),
          backgroundColor: WidgetStateProperty.all(AppColors.primaryColor),
          foregroundColor: WidgetStateProperty.all(Colors.white),
          textStyle: WidgetStateProperty.all(const TextStyle(
            fontSize: 14,
            fontFamily: AppConstance.appFont,
          )),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          ),
          minimumSize: WidgetStateProperty.all(Size(ctx.width, 50)),
        ),
      );

  static TextButtonThemeData textButtonThemeData() => TextButtonThemeData(
          style: TextButton.styleFrom(
        textStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ));

  static DialogTheme dialogTheme() => DialogTheme(
        shape: RoundedRectangleBorder(borderRadius: 24.radius),
        backgroundColor: AppColors.scaffoldLightThemeColor,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w500,
          fontFamily: AppConstance.appFont,
        ),
        contentTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontFamily: AppConstance.appFont,
        ),
      );

  static BottomSheetThemeData bottomSheetTheme() => BottomSheetThemeData(
        backgroundColor: AppColors.scaffoldLightThemeColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
      );

  static ListTileThemeData listTileTheme() => ListTileThemeData(
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          fontFamily: AppConstance.appFont,
        ),
      );
}
