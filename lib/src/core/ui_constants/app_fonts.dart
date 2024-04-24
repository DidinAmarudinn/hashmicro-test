import 'package:flutter/material.dart';
import 'package:hashmicro_test/src/core/ui_constants/app_colors.dart';
class AppFonts {
  AppFonts._();

  // Primary
  static TextStyle primaryRegularTextStyle = TextStyle(
    fontFamily: 'Raleway',
    color: AppColors.primaryTextColor,
    fontWeight: FontWeight.w500,
  );

  static TextStyle primaryLightTextStyle = TextStyle(
    fontFamily: 'Raleway',
    color: AppColors.grey,
    fontWeight: FontWeight.w400,
  );

  static TextStyle primarySemiBoldTextStyle = TextStyle(
    fontFamily: 'Raleway',
    color: AppColors.primaryTextColor,
    fontWeight: FontWeight.w600,
  );

  static TextStyle primaryBoldTextStyle = TextStyle(
    fontFamily: 'Raleway',
    color: AppColors.primaryTextColor,
    fontWeight: FontWeight.w700,
  );

  // White
  static TextStyle whiteRegularTextStyle = TextStyle(
    fontFamily: 'Raleway',
    color: AppColors.white,
    fontWeight: FontWeight.w500,
  );

  static TextStyle whiteSemiBoldTextStyle = TextStyle(
    fontFamily: 'Raleway',
    color: AppColors.white,
    fontWeight: FontWeight.w600,
  );

  // Grey
  static TextStyle greySemiBoldTextStyle = TextStyle(
    fontFamily: 'Raleway',
    color: AppColors.grey,
    fontWeight: FontWeight.w600,
  );
  static TextStyle greyRegularTextStyle = TextStyle(
    fontFamily: 'Raleway',
    color: AppColors.grey,
    fontWeight: FontWeight.w500,
  );

  // Green
  static TextStyle greenRegularTextStyle = TextStyle(
    fontFamily: 'Raleway',
    color: AppColors.green,
    fontWeight: FontWeight.w500,
  );

  // Red
  static TextStyle redRegularTextStyle = TextStyle(
    fontFamily: 'Raleway',
    color: AppColors.red,
    fontWeight: FontWeight.w500,
  );
  static TextStyle redBoldTextStyle = TextStyle(
    fontFamily: 'Raleway',
    color: AppColors.red,
    fontWeight: FontWeight.w700,
  );

  static TextStyle greenLightTextStyle = TextStyle(
    fontFamily: 'Raleway',
    color: AppColors.green,
    fontWeight: FontWeight.w400,
  );

  static TextStyle greenSemiBoldTextStyle = TextStyle(
    fontFamily: 'Raleway',
    color: AppColors.green,
    fontWeight: FontWeight.w600,
  );

  static TextStyle greenBoldTextStyle = TextStyle(
    fontFamily: 'Raleway',
    color: AppColors.green,
    fontWeight: FontWeight.w700,
  );
}

class AppTextTheme {
  static TextTheme get theme => TextTheme(
        titleLarge: TextStyle(
          fontFamily: 'Raleway',
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: AppColors.primaryTextColor,
          letterSpacing: 0.25,
        ),
        titleMedium: TextStyle(
          fontFamily: 'Raleway',
          fontSize: 14,
          color: AppColors.primaryTextColor,
          fontWeight: FontWeight.w700,
        ),
        titleSmall: TextStyle(
          fontFamily: 'Raleway',
          fontSize: 10,
          color: AppColors.primaryTextColor,
          fontWeight: FontWeight.w700,
        ),
        bodySmall: TextStyle(
          fontFamily: 'Raleway',
          fontSize: 12,
          color: AppColors.primaryTextColor,
          fontWeight: FontWeight.w400,
        ),
        bodyLarge: TextStyle(
          fontFamily: 'Raleway',
          fontSize: 16,
          color: AppColors.primaryTextColor,
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          fontFamily: 'Raleway',
          fontSize: 14,
          color: AppColors.primaryTextColor,
          fontWeight: FontWeight.w400,
        ),
      );
}
