import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses.dart';
// import 'package:flutter/services.dart';

var KColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromRGBO(80, 200, 120, 1),
);

var KDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark, // fromSeed generates shades for light mode
  seedColor: const Color.fromRGBO(21, 71, 52, 1),
);

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]).then((fn) {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        colorScheme: KColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: KColorScheme.onPrimaryContainer,
          foregroundColor: KColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: KColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: KColorScheme.primaryContainer),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: KColorScheme.onSecondaryContainer,
                  fontSize: 14),
            ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: KDarkColorScheme,
        cardTheme: const CardTheme().copyWith(
          color: KDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: KDarkColorScheme.primaryContainer,
            foregroundColor: KDarkColorScheme.onPrimaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: KDarkColorScheme.onSurface,
                  fontSize: 14),
              bodySmall: TextStyle(
                color: KDarkColorScheme.onSurface,
              ),
              bodyLarge: TextStyle(
                color: KDarkColorScheme.onSurface,
              ),
              bodyMedium: TextStyle(
                color: KDarkColorScheme.onSurface,
              ),
            ),
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.green),
          hintStyle: TextStyle(color: Colors.green),
        ),
      ),

      // themeMode: ThemeMode.light,
      // this will make the app follow the system theme - but its the default setting
      home: Expenses(),
    ),
  );
  // }); // uncomment this to force the app to run in only portrait  up mode
}
