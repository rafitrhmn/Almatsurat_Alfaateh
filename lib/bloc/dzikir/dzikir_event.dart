import 'package:equatable/equatable.dart';

abstract class DzikirEvent extends Equatable {
  const DzikirEvent();

  @override
  List<Object?> get props => [];
}

/// Event untuk memuat dzikir pagi
class LoadDzikirPagi extends DzikirEvent {
  const LoadDzikirPagi();
}

/// Event untuk memuat dzikir petang
class LoadDzikirPetang extends DzikirEvent {
  const LoadDzikirPetang();
}

/// Event untuk pindah ke item berikutnya
class NextDzikir extends DzikirEvent {
  const NextDzikir();
}

/// Event untuk kembali ke item sebelumnya
class PrevDzikir extends DzikirEvent {
  const PrevDzikir();
}
