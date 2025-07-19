part of 'user_cubit.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class UserSuccess extends UserState {}

final class UserFailed extends UserState {
  String error;
  UserFailed({required this.error});
}

final class UserLoading extends UserState {}

final class ProdSuccess extends UserState {}

final class ProdFailed extends UserState {
  String error;
  ProdFailed({required this.error});
}

final class ProdLoading extends UserState {}

final class filterSuccess extends UserState {}




