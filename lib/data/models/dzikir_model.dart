import 'package:equatable/equatable.dart';

/// Model data untuk satu item dzikir.
/// Menggantikan Map<String, dynamic> yang tidak type-safe.
/// Field kategori dan keutamaan bersifat opsional (nullable).
class DzikirModel extends Equatable {
  final int no;
  final String surah;
  final String ayat;
  final String dibaca;
  final String dzikir;
  final String latin;
  final String arti;
  final String? kategori; // opsional — ada di data_sugro
  final String? keutamaan; // opsional — hanya sebagian item

  const DzikirModel({
    required this.no,
    required this.surah,
    required this.ayat,
    required this.dibaca,
    required this.dzikir,
    required this.latin,
    required this.arti,
    this.kategori,
    this.keutamaan,
  });

  /// Factory dari Map (untuk kompatibilitas data lama)
  factory DzikirModel.fromMap(Map<String, dynamic> map) {
    return DzikirModel(
      no: map['no'] as int? ?? 0,
      surah: map['surah'] as String? ?? '',
      ayat: map['ayat'] as String? ?? '',
      dibaca: map['dibaca'] as String? ?? '1',
      dzikir: map['dzikir'] as String? ?? '',
      latin: map['latin'] as String? ?? '',
      arti: map['arti'] as String? ?? '',
      kategori: map['kategori'] as String?,
      keutamaan: map['keutamaan'] as String?,
    );
  }

  /// Konversi ke Map jika diperlukan
  Map<String, dynamic> toMap() {
    return {
      'no': no,
      'surah': surah,
      'ayat': ayat,
      'dibaca': dibaca,
      'dzikir': dzikir,
      'latin': latin,
      'arti': arti,
      if (kategori != null) 'kategori': kategori,
      if (keutamaan != null) 'keutamaan': keutamaan,
    };
  }

  /// CopyWith untuk immutability
  DzikirModel copyWith({
    int? no,
    String? surah,
    String? ayat,
    String? dibaca,
    String? dzikir,
    String? latin,
    String? arti,
    String? kategori,
    String? keutamaan,
  }) {
    return DzikirModel(
      no: no ?? this.no,
      surah: surah ?? this.surah,
      ayat: ayat ?? this.ayat,
      dibaca: dibaca ?? this.dibaca,
      dzikir: dzikir ?? this.dzikir,
      latin: latin ?? this.latin,
      arti: arti ?? this.arti,
      kategori: kategori ?? this.kategori,
      keutamaan: keutamaan ?? this.keutamaan,
    );
  }

  @override
  List<Object?> get props => [
        no,
        surah,
        ayat,
        dibaca,
        dzikir,
        latin,
        arti,
        kategori,
        keutamaan,
      ];

  @override
  String toString() =>
      'DzikirModel(no: $no, surah: $surah, kategori: $kategori)';
}
