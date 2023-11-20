import 'package:expence_tracker/widget/expances.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';

var kColourSchema = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 157, 115, 230),
);
var kDarkColourSchema = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 5, 99, 125),
);

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]).then((fn) {});

  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColourSchema,
        cardTheme: const CardTheme().copyWith(
          color: kDarkColourSchema.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor: kDarkColourSchema.primaryContainer,
            foregroundColor: kDarkColourSchema.onPrimaryContainer,
          ),
        ),
      ),
      theme: ThemeData().copyWith(
          colorScheme: kColourSchema,
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kColourSchema.onPrimaryContainer,
            foregroundColor: kColourSchema.primaryContainer,
          ),
          cardTheme: const CardTheme().copyWith(
            color: kColourSchema.secondaryContainer,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            )),
          ),
          textTheme: ThemeData().textTheme.copyWith(
                  titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: kColourSchema.onSecondaryContainer,
                fontSize: 16,
              ))),
      home: const Expances(),
    ),
  );
}
