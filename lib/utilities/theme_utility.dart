import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'my_consts.dart';

class ThemeUtility {

  static ThemeData themeData = ThemeData(
    primaryColor: const Color(0xffFFFFFF),
    primaryColorDark: const Color(0xffFFFFFF),
    indicatorColor: const Color(0xff000000),
    appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xff0A0A15),
        iconTheme: IconThemeData(color: Color(0xffFFFFFF))),
    brightness: Brightness.light,
    buttonTheme: const ButtonThemeData(
      // buttonColor: Helper.parseColorCode(Get.find<ConfigService>().configData.value.btnColorLight), //  <-- dark color
      textTheme: ButtonTextTheme.primary, //
    ),
    highlightColor: MyConsts.textColor,
    hintColor: Colors.grey[300],
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(
          primary: const Color(0xffF2660F),
          secondary: const Color(0xffEC9912),
        )
        .copyWith(background: const Color(0xffF6FBF8))
        .copyWith(error: const Color(0xffF6534C)),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.poppins().copyWith(
          fontSize: 10,
          color: MyConsts.primaryColor,
          fontWeight: FontWeight.bold,
          fontFamily: 'Gilroy'),
      headlineSmall: GoogleFonts.poppins().copyWith(
          fontSize: 12,
          color: MyConsts.textColor,
          fontWeight: FontWeight.bold,
          fontFamily: 'Gilroy'),
      headlineMedium: GoogleFonts.poppins().copyWith(
          fontSize: 20,
          color: MyConsts.primaryColor,
          fontWeight: FontWeight.bold,
          fontFamily: 'Gilroy'),
      displaySmall: GoogleFonts.poppins().copyWith(
          fontSize: 16,
          color: MyConsts.textColor,
          fontWeight: FontWeight.bold,
          fontFamily: 'Gilroy'),
      displayMedium: GoogleFonts.poppins().copyWith(
          fontSize: 18,
          color: MyConsts.textColor,
          fontWeight: FontWeight.bold,
          fontFamily: 'Gilroy'),
      displayLarge: GoogleFonts.poppins().copyWith(
          fontSize: 20,
          color: MyConsts.textColor,
          fontWeight: FontWeight.bold,
          fontFamily: 'Gilroy'),
      titleMedium: GoogleFonts.poppins(),
      bodyLarge: GoogleFonts.poppins().copyWith(
          fontSize: 15,
          color: MyConsts.textColor,
          fontWeight: FontWeight.w400,
          fontFamily: 'Gilroy'),
      bodyMedium: GoogleFonts.poppins().copyWith(
          fontSize: 14,
          color: MyConsts.textColor,
          fontWeight: FontWeight.w400,
          fontFamily: 'Gilroy'),
    ),
  );

}
