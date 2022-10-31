import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_de_leyes/pages/quiz/quiz_preview_page.dart';
import '../../../model/checked_question.dart';
import '../../../model/question.dart';
import '../../../service/test_service.dart';

part 'test_event.dart';
part 'test_state.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  final TestService service;

  List<int> answers = [];
  List<int> corrects = [];
  List<int> checkedExamn = [];

  List<Question> questions = [];

  var current = 0;

  var total = 20;

  TestBloc(this.service) : super(TestInitial()) {
    on<TestEvent>((event, emit) async {
      // emit(TestLoading());
      if (event is DataTestLoad) {
        var test = await service.readJson(event.test);
        total = test.length;
        print("holiiiiiiiii");
        emit(TestsLoaded(test, current));
      } else if (event is LoadData) {
        total = event.tests.length;
        questions = event.tests;
        emit(TestsLoaded(event.tests, current));
      }

      // TODO: implement event handler
    });
  }

  saveAnswer(int answer) async {
    /* if(questions.length-1 == current){

    }*/

    print(
        "current  + $current      tamaño   ${questions.length}     ---- answers ${answers.length}");
    if (answers.length > current) {
      answers[current] = answer;
    } else {
      answers.add(answer);
    }

    //answers.add(answer);
    questions[current].selected = answer;
    current += 1;
  }

  addCorrect(List<Question> list) {
    for (int i = 0; i < list.length; i++) {
      corrects.add(int.parse(list[i].answer));
    }
  }

  Future<CheckedList> checkExam(
      List<Question> list, int test, String name, TypeEnum type) async {
    addCorrect(list);
    List<CheckedQuestion> checkedQuestions = [];
    for (int i = 0; i < answers.length; i++) {
      print("$i tamaño corrrrr ${corrects.length}");
      // print("${answers[i]} ------ ${corrects[i]}");

      var checkedQuestion = CheckedQuestion(
          question: list[i],
          answer: answers[i],
          correct: corrects[i],
          typeEnum: type);

      checkedQuestions.add(checkedQuestion);
    }

    var checkedList = CheckedList(
        questions: checkedQuestions, test: test, name: name, typeEnum: type);

    return checkedList;
  }

  /* CalendarBloc(this.service) : super(CalendarInitial()) {
    on<CalendarEvent>((event, emit) async {
      emit(CalendarLoading());
      var days = await service.firstInserction();
      emit(CalendarLoaded(days, service.lastDayCompleted));
    });
  } */
}
