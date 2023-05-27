import 'package:flutter/material.dart';

class Spacings {
  static double xxxsmall = 2;
  static double xxsmall = 4;
  static double xsmall = 8;
  static double small = 12;
  static double normal = 15;
  static double medium = 20;
  static double large = 25;
  static double xlarge = 30;
  static double xxlarge = 35;
  static double xxxlarge = 40;
  static double xxxxlarge = 54;
}

Color blue = const Color(0xff6633FF);
Color green = const Color(0xff20BD52);

BoxDecoration boxDecoration = BoxDecoration(
    gradient: LinearGradient(
        begin: const AlignmentDirectional(0.09, -2.5),
        end: const AlignmentDirectional(-0.09, 2.5),
        stops: const [
          0,
          1
        ],
        colors: [
          green,
          blue,
        ]
    ),
    borderRadius: BorderRadius.circular(12.0)
);

BoxDecoration timerBoxDecoration = BoxDecoration(
      color: const Color(0xffEAEDF1),
  borderRadius: BorderRadius.circular(4.0),

);

var defaultTheme = ThemeData();

ThemeData appTheme = ThemeData(
  fontFamily: 'HeadingNowTrial',
  colorScheme: ColorScheme.fromSwatch(
    backgroundColor: const Color.fromARGB(255, 29, 29, 37),
    primarySwatch: const MaterialColor(0xffffffff, {
      50: Color(0xffffffff),
      100: Color(0xffffffff),
      200: Color(0xffffffff),
      300: Color(0xffffffff),
      400: Color(0xffffffff),
      500: Color(0xffffffff),
      600: Color(0xffffffff),
      700: Color(0xffffffff),
      800: Color(0xffffffff),
      900: Color(0xffffffff),
    }),
  ).copyWith(
    tertiary: const Color(0xff20BD52),
    outline: const Color(0xff1e4899),
  ),
  scaffoldBackgroundColor: const Color(0xffffffff),
  indicatorColor: const Color(0xff1e4899),
  dividerColor: const Color(0xffeff2f5),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: const BorderSide(color: Color(0xffEEEEF4)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: const BorderSide(color: Color(0xffEEEEF4)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: const BorderSide(color: Color(0xffEEEEF4)),
    ),
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Color(0xff07052A),
    selectionColor: Color(0xff1e4899),
  ),
  textTheme: TextTheme(
    titleMedium: defaultTheme.textTheme.titleMedium!.copyWith(
      color: const Color(0xff07052A),
      fontSize: 16,
    ),
    bodyMedium: defaultTheme.textTheme.bodyMedium!.copyWith(
      color: const Color(0xff8C919D),
      fontSize: 13,
    ),
    bodySmall: defaultTheme.textTheme.bodySmall!.copyWith(
      color: const Color(0xff8C919D),
      fontSize: 12,
    ),

  ),
);



