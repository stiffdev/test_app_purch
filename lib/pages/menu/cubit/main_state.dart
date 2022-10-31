part of 'main_cubit.dart';

@immutable
abstract class MainState {}

class MainInitial extends MainState {}

class MainDial extends MainState {}

class MainDismiss extends MainState {}

class MainInfoLoaded extends MainState {}

class MainInfoLoading extends MainState {}

class MainDialLimit extends MainState {}
