import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/utils/app_logger.dart';
import '../../data/repositories/dzikir_repository.dart';
import 'dzikir_event.dart';
import 'dzikir_state.dart';

class DzikirBloc extends Bloc<DzikirEvent, DzikirState> {
  final DzikirRepository _repository;

  DzikirBloc({required DzikirRepository repository})
      : _repository = repository,
        super(const DzikirInitial()) {
    on<LoadDzikirPagi>(_onLoadDzikirPagi);
    on<LoadDzikirPetang>(_onLoadDzikirPetang);
    on<NextDzikir>(_onNextDzikir);
    on<PrevDzikir>(_onPrevDzikir);
  }

  /// Handler: muat data dzikir pagi
  void _onLoadDzikirPagi(
    LoadDzikirPagi event,
    Emitter<DzikirState> emit,
  ) {
    try {
      emit(const DzikirLoading());
      final data = _repository.getDzikirPagi();
      emit(DzikirLoaded(listDzikir: data));
      AppLogger.info('Dzikir Pagi loaded: ${data.length} item');
    } catch (e, stackTrace) {
      AppLogger.error('Gagal load dzikir pagi',
          exception: e, stackTrace: stackTrace);
      emit(const DzikirError(message: 'Gagal memuat data dzikir pagi'));
    }
  }

  /// Handler: muat data dzikir petang
  void _onLoadDzikirPetang(
    LoadDzikirPetang event,
    Emitter<DzikirState> emit,
  ) {
    try {
      emit(const DzikirLoading());
      final data = _repository.getDzikirPetang();
      emit(DzikirLoaded(listDzikir: data));
      AppLogger.info('Dzikir Petang loaded: ${data.length} item');
    } catch (e, stackTrace) {
      AppLogger.error('Gagal load dzikir petang',
          exception: e, stackTrace: stackTrace);
      emit(const DzikirError(message: 'Gagal memuat data dzikir petang'));
    }
  }

  /// Handler: pindah ke item berikutnya
  void _onNextDzikir(
    NextDzikir event,
    Emitter<DzikirState> emit,
  ) {
    final current = state;
    if (current is DzikirLoaded && !current.isLast) {
      emit(current.copyWith(currentIndex: current.currentIndex + 1));
      AppLogger.info('Next dzikir → index ${current.currentIndex + 1}');
    }
  }

  /// Handler: kembali ke item sebelumnya
  void _onPrevDzikir(
    PrevDzikir event,
    Emitter<DzikirState> emit,
  ) {
    final current = state;
    if (current is DzikirLoaded && !current.isFirst) {
      emit(current.copyWith(currentIndex: current.currentIndex - 1));
      AppLogger.info('Prev dzikir → index ${current.currentIndex - 1}');
    }
  }
}
