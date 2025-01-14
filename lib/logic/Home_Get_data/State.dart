import 'package:doctor_appointment/data/HomeDataModel.dart';
import 'package:equatable/equatable.dart';

abstract class SpecializationsState extends Equatable {
  const SpecializationsState();

  @override
  List<Object?> get props => [];
}

class SpecializationsInitial extends SpecializationsState {}

class SpecializationsLoading extends SpecializationsState {}

class SpecializationsLoaded extends SpecializationsState {
  final List<Specialization> specializations;

  const SpecializationsLoaded({required this.specializations});

  @override
  List<Object?> get props => [specializations];
}

class SpecializationsError extends SpecializationsState {
  final String error;

  const SpecializationsError({required this.error});

  @override
  List<Object?> get props => [error];
}
