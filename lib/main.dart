import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/dzikir/dzikir_bloc.dart';
import 'core/utils/app_bloc_observer.dart';
import 'data/repositories/dzikir_repository.dart';
import 'screen/home/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Paksa orientasi portrait saja
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Set BlocObserver — hanya aktif di debug mode
  Bloc.observer = AppBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DzikirBloc(
        repository: DzikirRepository(),
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
