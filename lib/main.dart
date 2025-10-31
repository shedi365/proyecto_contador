import 'package:flutter/material.dart';
import 'package:proyecto_contador/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        useMaterial3: true,
      ),
      initialRoute: 'home',
      routes: {
        'home': (context) => const HomeScreen(),
      },
    );
  }
}