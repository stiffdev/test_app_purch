part of 'test_by_title_bloc_bloc.dart';

@immutable
abstract class TestByTitleBlocEvent {}

class DataTestLoad extends TestByTitleBlocEvent {
  String test;
  DataTestLoad(this.test) : super();
}

class DataTestLoad2 extends TestByTitleBlocEvent {
  String test;
  DataTestLoad2(this.test) : super();
}

class DataCommonTestLoad extends TestByTitleBlocEvent {
  String test;
  DataCommonTestLoad(this.test) : super();
}

class DataErrorTestLoad extends TestByTitleBlocEvent {
  DatabaseHelper test;
  DataErrorTestLoad(this.test) : super();
}
