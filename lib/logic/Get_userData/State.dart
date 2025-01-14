import '../../data/UserDataGet.dart';

abstract class UserCubitState {}

class UserLoading extends UserCubitState {}

class UserLoaded extends UserCubitState {
  final UserData data;

  UserLoaded(this.data);
}

class UserError extends UserCubitState {
  final String error;

  UserError(this.error);
}