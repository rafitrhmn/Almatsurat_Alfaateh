import 'package:apk_almatsurat/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/dzikir/dzikir_bloc.dart';
import '../../bloc/dzikir/dzikir_event.dart';
import '../../core/constants/app_strings.dart';
import '../dzikir_pagi/dzikir_pagi_page.dart';
import '../dzikir_petang/dzikir_petang_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          // =====================
          // BAGIAN PAGI
          // =====================
          _buildPagiSection(context, screenWidth, screenHeight),

          // =====================
          // BAGIAN PETANG
          // =====================
          _buildPetangSection(context, screenWidth, screenHeight),
        ],
      ),
    );
  }

  Widget _buildPagiSection(
    BuildContext context,
    double screenWidth,
    double screenHeight,
  ) {
    return GestureDetector(
      onTap: () {
        context.read<DzikirBloc>().add(const LoadDzikirPagi());
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const DzikirPagiPage()),
        );
      },
      child: Stack(
        children: [
          // Background gambar pagi
          Image.asset(
            'assets/images/gambar_pagi.png',
            width: screenWidth,
            height: screenHeight * 0.5,
            fit: BoxFit.cover,
          ),

          // Teks "Dzikir Sugro"
          const Padding(
            padding: EdgeInsets.only(top: 80),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppStrings.dzikirSugro,
                  style: TextStyle(
                    fontFamily: 'Dongle',
                    color: AppColors.homePagiText,
                    fontSize: 63,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),

          // Teks "Pagi"
          const Padding(
            padding: EdgeInsets.only(top: 101),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppStrings.pagi,
                  style: TextStyle(
                    fontFamily: 'Dongle',
                    color: AppColors.homePagiText,
                    fontSize: 133,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPetangSection(
    BuildContext context,
    double screenWidth,
    double screenHeight,
  ) {
    return GestureDetector(
      onTap: () {
        context.read<DzikirBloc>().add(const LoadDzikirPetang());
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const DzikirPetangPage()),
        );
      },
      child: Stack(
        children: [
          // Background gambar petang
          Image.asset(
            'assets/images/gambar_petang.png',
            width: screenWidth,
            height: screenHeight * 0.5,
            fit: BoxFit.cover,
          ),

          // Teks "Dzikir Sugro"
          const Padding(
            padding: EdgeInsets.only(top: 42),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppStrings.dzikirSugro,
                  style: TextStyle(
                    fontFamily: 'Dongle',
                    color: AppColors.homePetangText,
                    fontSize: 63,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),

          // Teks "Petang"
          const Padding(
            padding: EdgeInsets.only(top: 63),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppStrings.petang,
                  style: TextStyle(
                    fontFamily: 'Dongle',
                    color: AppColors.homePetangText,
                    fontSize: 133,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
