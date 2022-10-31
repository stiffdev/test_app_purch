import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_de_leyes/db/Database.dart';

import '../../../../model/question.dart';
import '../../../../service/test_service.dart';

part 'test_by_title_bloc_event.dart';
part 'test_by_title_bloc_state.dart';

class TestByTitleBlocBloc
    extends Bloc<TestByTitleBlocEvent, TestByTitleBlocState> {
  final TestService service;

  TestByTitleBlocBloc(this.service) : super(TestByTitleBlocInitial()) {
    on<TestByTitleBlocEvent>((event, emit) async {
      if (event is DataTestLoad) {
        var test = await service.getRandomQuestions(int.parse(event.test));
        emit(TestsLoaded(test, 0));
      } else if (event is DataTestLoad2) {
        var test = await service.readJson(int.parse(event.test));
        emit(TestsLoaded(test, 0));
      } else if (event is DataCommonTestLoad) {
        var test = await service.getRandomQuestionsCommon(event.test);
        emit(TestsLoaded(test, 0));
      } else if (event is DataErrorTestLoad) {
        var test = await service.getErrorQuestions(event.test);
        emit(TestsLoaded(test, 0));
      }
    });
  }
}
