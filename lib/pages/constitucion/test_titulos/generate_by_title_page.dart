import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common_widget/buttons.dart';
import '../../../helpers/const.dart';
import '../../../model/question.dart';
import '../../../service/test_service.dart';
import '../../quiz/quiz_preview_page.dart';
import 'bloc/test_by_title_bloc_bloc.dart';

const details = {
  0: 'Título Preliminar',
  1: 'Título I: De los derechos y deberes fundamentales',
  2: 'Título II: De la Corona',
  3: 'Título III. De las Cortes Generales',
  4: 'Título IV. Del Gobierno y de la Administración',
  5: 'Título V. De las relaciones entre el Gobierno y las Cortes Generales',
  6: 'Título VI. Del Poder Judicial',
  7: 'Título VII. Economía y Hacienda',
  8: 'Título VIII. De la Organización Territorial del Estado',
  9: 'Título IX. Del Tribunal Constitucional',
  10: '	Título X. De la reforma constitucional'
};

class TitleGenerateTestPage extends StatefulWidget {
  TitleGenerateTestPage({Key? key}) : super(key: key);

  @override
  State<TitleGenerateTestPage> createState() => _TitleGenerateTestPageState();
}

class _TitleGenerateTestPageState extends State<TitleGenerateTestPage> {
  @override
  Widget build(BuildContext context) {
    final num = ModalRoute.of(context)!.settings.arguments as int;

    return BlocProvider(
      create: (context) => TestByTitleBlocBloc(TestService()),
      child: Material(
        child: Container(
            color: primaryColor,
            child: CustomScrollView(slivers: [
              customAppBar(details[num].toString(), "assets/images/book2.jpg"),
              SliverList(
                delegate: SliverChildListDelegate([
                  const SizedBox(height: 10),
                  Text(
                    "",
                    style: GoogleFonts.openSans(
                        color: Colors.white,
                        fontStyle: FontStyle.normal,
                        fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 50),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(paddingDialog),
                        child: Text(
                          "Domina de una vez por todas el ${details[num].toString()} de la Constitución Española con los tests más completos!",
                          style: GoogleFonts.openSans(
                              color: Colors.white,
                              fontStyle: FontStyle.italic,
                              fontSize: 20),
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
                                  .add(DataTestLoad(num.toString()));
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
                          /*  Navigator.pushNamed(context, '/exapreview2',
                              arguments: state.list);*/
                        });

                        return GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, '/exapreview2',
                                arguments: state.list),
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

Widget customAppBar(String text, String img) {
  return SliverAppBar(
    elevation: 2.0,
    backgroundColor: Colors.indigo,
    expandedHeight: 200,
    floating: false,
    pinned: true,
    flexibleSpace: FlexibleSpaceBar(
      centerTitle: true,
      title: Text(
        text,
        style: GoogleFonts.openSans(
            color: Colors.white, fontStyle: FontStyle.normal, fontSize: 19),
        textAlign: TextAlign.center,
      ),
      background: FadeInImage(
        image: AssetImage(img),
        placeholder: AssetImage(img),
        fadeInDuration: Duration(milliseconds: 2000),
        fit: BoxFit.cover,
      ),
    ),
  );
}
