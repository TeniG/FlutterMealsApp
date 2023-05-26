import 'package:flutter/material.dart';
import 'package:flutter_meals_app/screens/categories_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const App());
}

final mytheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Color.fromARGB(255, 203, 64, 94),
    brightness: Brightness.dark,
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: mytheme,
      home: const CategoriesScreen(),
    );
  }
}
