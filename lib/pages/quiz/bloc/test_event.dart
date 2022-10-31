part of 'test_bloc.dart';

@immutable
abstract class TestEvent {}

class DataTestLoad extends TestEvent {
  int test;
  DataTestLoad(this.test) : super();
}

class LoadData extends TestEvent {
  List<Question> tests;
  LoadData(this.tests) : super();
}
