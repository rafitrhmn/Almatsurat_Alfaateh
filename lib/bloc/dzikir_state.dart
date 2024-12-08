import 'package:equatable/equatable.dart';

abstract class DzikirState extends Equatable {
  @override
  List<Object?> get props => [];
}

// State awal sebelum data diambil
class DzikirInitialState extends DzikirState {}

// State saat data sedang dimuat
class DzikirLoadingState extends DzikirState {}

// State saat data berhasil dimuat
class DzikirLoadedState extends DzikirState {
  final List<Map<String, dynamic>> dzikirData;

  DzikirLoadedState({required this.dzikirData});

  @override
  List<Object?> get props => [dzikirData];
}

// State saat terjadi kesalahan
class DzikirErrorState extends DzikirState {
  final String error;

  DzikirErrorState({required this.error});

  @override
  List<Object?> get props => [error];
}
