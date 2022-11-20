import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_de_leyes/model/ley.dart';

import '../../common_widget/buttons.dart';
import '../../helpers/const.dart';
import '../../model/question.dart';
import '../../service/test_service.dart';
import '../constitucion/test_titulos/bloc/test_by_title_bloc_bloc.dart';
import '../constitucion/test_titulos/generate_by_title_page.dart';
import '../quiz/quiz_preview_page.dart';

class GeneralGenerateTestPage extends StatefulWidget {
  const GeneralGenerateTestPage({Key? key}) : super(key: key);

  @override
  State<GeneralGenerateTestPage> createState() =>
      _GeneralGenerateTestPageState();
}

class _GeneralGenerateTestPageState extends State<GeneralGenerateTestPage> {
  @override
  Widget build(BuildContext context) {
    final num = ModalRoute.of(context)!.settings.arguments as Ley;

    return BlocProvider(
      create: (context) => TestByTitleBlocBloc(TestService()),
      child: Material(
        child: Container(
            color: primaryColor,
            child: CustomScrollView(slivers: [
              customAppBar(num.shortTitle, num.img),
              SliverList(
                delegate: SliverChildListDelegate([
                  const SizedBox(height: 10),
                  Text(
                    "",
                    style: GoogleFonts.openSans(
                        color: Colors.white,
                        fontStyle: FontStyle.normal,
                        fontSize: 26),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 50),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(paddingDialog),
                        child: Text(
                          "Domina de una vez por todas tu prueba de ${num.shortTitle.toString()} con los tests más completos!",
                          style: GoogleFonts.openSans(
                              color: Colors.white,
                              fontStyle: FontStyle.italic,
                              fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 50),
                  BlocBuilder<TestByTitleBlocBloc, TestByTitleBlocState>(
                    builder: (context, state) {
                      if (state is TestByTitleBlocInitial) {
                        return Container(
                          padding: EdgeInsets.all(20.0),
                          child: MainButton(
                            onPressed: () {
                              context
                                  .read<TestByTitleBlocBloc>()
                                  .add(DataCommonTestLoad(num.file.toString()));
                              //setLocale(context);

                              // Navigator.pushNamed(context, '/menu');
                            },
                            text: 'Generar Test',
                          ),
                        );
                      } else if (state is TestLoading) {
                        return CircularProgressIndicator();
                      } else if (state is TestsLoaded) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          var qp = QuestionsPreview(
                              questions: state.list, typeEnum: TypeEnum.common);

                          Navigator.pushReplacementNamed(
                              context, '/quizpreview',
                              arguments: qp);
                        });

                        return GestureDetector(
                            onTap: () {},
                            /*Navigator.pushNamed(
                                context, '/exapreview2',
                                arguments: state.list),*/
                            child: Container(
                                /* height: 100,
                              width: 100,
                              color: primearyAccColor,*/
                                ));
                      } else {
                        return Container();
                        /*   return Container(
                          padding: EdgeInsets.all(20.0),
                          child: MainButton(
                            onPressed: () {
                              //setLocale(context);

                              Navigator.pushNamed(context, '/menu');
                            },
                            text: 'Generar Test',
                          ),
                        );*/
                      }
                    },
                  )
                ]),
              ),
              // )
            ])),
      ),
    );
  }
}
