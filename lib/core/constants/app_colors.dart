import 'package:flutter/material.dart';

/// Semua warna aplikasi Al-Matsurat terpusat di sini.
/// Tidak ada warna yang boleh ditulis hardcoded di widget.
class AppColors {
  AppColors._(); // mencegah instansiasi

  // --- Warna Dzikir Pagi ---
  static const Color pagiBackground = Color(0xFFE48D58);

  // --- Warna Dzikir Petang ---
  static const Color petangBackground = Color(0xFFDE6378);

  // --- Warna Teks Home ---
  static const Color homePagiText = Color(0xFF1F0B0D);
  static const Color homePetangText = Color(0xFF401C48);

  // --- Warna Teks Umum ---
  static const Color textWhite = Colors.white;
  static const Color textError = Colors.red;

  // --- Warna Error ---
  static const Color error = Colors.red;
}
