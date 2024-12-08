import 'package:apk_almatsurat/bloc/dzikir_bloc.dart';
import 'package:apk_almatsurat/bloc/obsaver_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screen/home.dart';
import 'package:flutter/material.dart';
// Assuming the data is stored in a file called data.dart

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // Memberikan DzikirBloc pada seluruh aplikasi
      create: (BuildContext context) => DzikirBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true, // Menggunakan tema Material Design 3
        ),
        home: const HomeScreen(), // Layar awal aplikasi
      ),
    );
  }
}
