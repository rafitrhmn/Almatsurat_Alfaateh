import 'data/matsurat_pagi_sugro.dart';
import 'screen/home.dart';
import 'package:flutter/material.dart';
// Assuming the data is stored in a file called data.dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}