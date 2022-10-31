part of 'test_by_title_bloc_bloc.dart';

@immutable
abstract class TestByTitleBlocState {}

class TestByTitleBlocInitial extends TestByTitleBlocState {}

class TestLoading extends TestByTitleBlocState {}

class TestsLoaded extends TestByTitleBlocState {
  List<Question> list;
  int lastDay;

  TestsLoaded(this.list, this.lastDay) : super();
}
