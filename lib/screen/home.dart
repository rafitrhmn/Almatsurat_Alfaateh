import 'package:apk_almatsurat/bloc/dzikir_bloc.dart';
import 'package:apk_almatsurat/bloc/dzikir_event.dart';
import 'package:apk_almatsurat/screen/dzikir_pagi_page.dart';
import 'package:apk_almatsurat/screen/dzikir_petang_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenWidth2 = screenWidth / 2;
    return Scaffold(
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              // Memanggil FetchDzikirPagiEvent sebelum navigasi
              context.read<DzikirBloc>().add(FetchDzikirPagiEvent());

              // Navigasi ke DzikirPagiPage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DzikirPagiPage()),
              );
            },
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/gambar_pagi.png',
                  width: screenWidth,
                  height: screenHeight * 0.5,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Dzikir Sugro',
                        style: TextStyle(
                            fontFamily: 'Dongle',
                            color: Color(0xFF1F0B0D),
                            fontSize: 63,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 101),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Pagi',
                        style: TextStyle(
                            fontFamily: 'Dongle',
                            color: Color(0xFF1F0B0D),
                            fontSize: 133,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              // Memanggil FetchDzikirPagiEvent sebelum navigasi
              context.read<DzikirBloc>().add(FetchDzikirPetangEvent());

              // Navigasi ke DzikirPagiPage
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DzikirPetangPage()),
              );
            },
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/gambar_petang.png',
                  width: screenWidth,
                  height: screenHeight * 0.5,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 42),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Dzikir Sugro',
                        style: TextStyle(
                            fontFamily: 'Dongle',
                            color: Color(0xFF401C48),
                            fontSize: 63,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 63),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Petang',
                        style: TextStyle(
                            fontFamily: 'Dongle',
                            color: Color(0xFF401C48),
                            fontSize: 133,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
