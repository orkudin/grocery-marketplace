import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_marketplace/screens/auth/auth_screen.dart';
import 'package:grocery_marketplace/screens/tabs_Screen.dart';

final colorScheme = ColorScheme.fromSeed(
  brightness: Brightness.light,
  seedColor: const Color.fromARGB(0, 0, 0, 1),
  background: const Color.fromRGBO(255, 255, 255, 1),
);

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: colorScheme,
  // ColorScheme.fromSeed(
  //     brightness: Brightness.light,
  //     seedColor: Color.fromRGBO(255, 255, 255, 1)),
  textTheme: GoogleFonts.poppinsTextTheme()
  // textTheme: TextTheme() GoogleFonts.poppinsTextTheme(),
);

void main() {
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: AuthScreen(),
      // TabsScreen(),
    );
  }
}
