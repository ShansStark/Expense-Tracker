import 'package:flutter/material.dart';
import 'package:expenseapp/widgets/expenses.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

var kColourScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(234, 74, 114, 178));

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: Colors.deepPurpleAccent,
);
void main() {
  //BELOW IS THE ONE WAY OF LOCKING THE OREITATION OF THE APP FOR STABLE
  /* SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((ctx) => */
  runApp(MaterialApp(
    darkTheme: ThemeData.dark().copyWith(
      useMaterial3: true,
      colorScheme: kDarkColorScheme,
      cardTheme: const CardTheme().copyWith(
          color: kDarkColorScheme.secondary,
          margin: const EdgeInsets.fromLTRB(25, 8, 25, 8),
          elevation: 5.5),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        backgroundColor: kDarkColorScheme.onTertiary,
      )),
    ),
    //Theme
    theme: ThemeData().copyWith(
      useMaterial3: true,
      colorScheme: kColourScheme,
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: kColourScheme.onPrimaryContainer,
        foregroundColor: kColourScheme.primary,
        centerTitle: true,
        elevation: 25,
      ),
      cardTheme: const CardTheme().copyWith(
        margin: const EdgeInsets.fromLTRB(25, 8, 25, 8),
        elevation: 5.5,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kColourScheme.secondaryContainer,
        ),
      ),
      textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(
              fontWeight: FontWeight.bold,
              color: kColourScheme.primary,
              fontSize: 20,
              fontFamily: GoogleFonts.seaweedScript.toString(),
            ),
            //alternate method // titleLarge: ThemeData().textTheme.titleLarge.copyWith(),
          ),
    ),
    debugShowCheckedModeBanner: false,
    themeMode: ThemeMode.system,
    home: const Expenses(),
  ));
  //}); //THE END BRACKETS FOR THE OREITATION FUNCTION
}
