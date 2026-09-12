import 'package:equatable/equatable.dart';
import '../../data/models/dzikir_model.dart';

abstract class DzikirState extends Equatable {
  const DzikirState();

  @override
  List<Object?> get props => [];
}

/// State awal sebelum ada event
class DzikirInitial extends DzikirState {
  const DzikirInitial();
}

/// State saat data sedang dimuat
class DzikirLoading extends DzikirState {
  const DzikirLoading();
}

/// State saat data berhasil dimuat
class DzikirLoaded extends DzikirState {
  final List<DzikirModel> listDzikir;
  final int currentIndex;

  const DzikirLoaded({
    required this.listDzikir,
    this.currentIndex = 0,
  });

  /// Total item dzikir
  int get totalItem => listDzikir.length;

  /// Item dzikir yang sedang ditampilkan
  DzikirModel get currentDzikir => listDzikir[currentIndex];

  /// Apakah sudah di item terakhir
  bool get isLast => currentIndex >= listDzikir.length - 1;

  /// Apakah masih di item pertama
  bool get isFirst => currentIndex == 0;

  /// CopyWith untuk update sebagian state
  DzikirLoaded copyWith({
    List<DzikirModel>? listDzikir,
    int? currentIndex,
  }) {
    return DzikirLoaded(
      listDzikir: listDzikir ?? this.listDzikir,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }

  @override
  List<Object?> get props => [listDzikir, currentIndex];
}

/// State saat terjadi error
class DzikirError extends DzikirState {
  final String message;

  const DzikirError({required this.message});

  @override
  List<Object?> get props => [message];
}
