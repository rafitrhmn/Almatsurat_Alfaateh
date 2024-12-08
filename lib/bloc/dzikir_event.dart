import 'package:equatable/equatable.dart';

abstract class DzikirEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchDzikirPagiEvent extends DzikirEvent {}

class FetchDzikirPetangEvent extends DzikirEvent {}
