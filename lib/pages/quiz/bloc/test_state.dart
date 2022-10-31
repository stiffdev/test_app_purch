part of 'test_bloc.dart';

@immutable
abstract class TestState {}

class TestInitial extends TestState {}

class TestLoading extends TestState {}

class TestsLoaded extends TestState {
  List<Question> list;
  int lastDay;

  TestsLoaded(this.list, this.lastDay) : super();
}
