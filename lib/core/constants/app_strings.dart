/// Semua string teks UI terpusat di sini.
class AppStrings {
  AppStrings._(); // mencegah instansiasi

  // --- Home Screen ---
  static const String appName = "Al-Mat'surat | Hasan Al Banna";
  static const String dzikirSugro = 'Dzikir Sugro';
  static const String pagi = 'Pagi';
  static const String petang = 'Petang';

  // --- Dzikir Page ---
  static const String dibacaPrefix = 'Dibaca ';
  static const String dibacaSuffix = ' x';

  // --- Error ---
  static const String errorPrefix = 'Error: ';
  static const String errorLoadData =
      'Gagal memuat data dzikir. Silakan coba lagi.';

  // --- Notifikasi (Tahap 3) ---
  static const String notifPagiTitle = 'Waktunya Dzikir Pagi 🌅';
  static const String notifPagiBody =
      'Waktunya membaca Al-Matsurat pagi. Mulai hari dengan dzikir.';
  static const String notifPetangTitle = 'Waktunya Dzikir Petang 🌇';
  static const String notifPetangBody =
      'Waktunya membaca Al-Matsurat petang. Tutup hari dengan dzikir.';

  // --- Settings (Tahap 4) ---
  static const String settings = 'Pengaturan';
  static const String pengingatPagi = 'Pengingat Dzikir Pagi';
  static const String pengingatPetang = 'Pengingat Dzikir Petang';
}
