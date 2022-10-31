import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:test_de_leyes/pages/constitucion/menu_constitucion_page.dart';
import 'package:test_de_leyes/pages/constitucion/test_titulos/generate_by_title_page.dart';
import 'package:test_de_leyes/pages/constitucion/test_titulos/test_titulos_menu.dart';
import 'package:test_de_leyes/pages/constitucion/test_variados/test_variados.dart';
import 'package:test_de_leyes/pages/custom_exam/custom_exam_page.dart';
import 'package:test_de_leyes/pages/errors_redo/errors_test_generation.dart';
import 'package:test_de_leyes/pages/estatutos/estatutos_menu_page.dart';
import 'package:test_de_leyes/pages/first_page.dart';
import 'package:test_de_leyes/pages/general_generate/general_generate_page.dart';
import 'package:test_de_leyes/pages/leyes/leyes_menu.dart';
import 'package:test_de_leyes/pages/menu/cubit/main_cubit.dart';
import 'package:test_de_leyes/pages/menu/menu_page.dart';
import 'package:test_de_leyes/pages/pay/paywall.dart';
import 'package:test_de_leyes/pages/progress/progress_page_stats.dart';
import 'package:test_de_leyes/pages/quiz/quiz_preview_page.dart';
import 'package:test_de_leyes/pages/quiz/test_final_result.dart';
import 'package:test_de_leyes/pages/quiz/test_revision_page.dart';
import 'package:test_de_leyes/purchases/purchases.dart';
import 'package:test_de_leyes/service/main_repository.dart';

import 'helpers/prefs.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = PreferencesUser();
  await prefs.initPrefs();
  await MobileAds.instance.initialize();
  PurchaseApi purchaseApi = PurchaseApi();
  await purchaseApi.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider(create: (_) => TestBloc(TestService())),
        BlocProvider(create: (context) => MainCubit(MainRepository())),
      ],
      child: MaterialApp(
          title: 'Test De Leyes',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textTheme: const TextTheme(
              headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
              headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
              bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
            ),
            primarySwatch: Colors.blue,
          ),
          initialRoute: '/',
          routes: {
            '/': (BuildContext context) => const FirstPage(),
            '/menu2': (BuildContext context) => GridDashboard(),
            '/constitucion': (BuildContext context) => ConstitucionMenu(),
            '/leyes': (BuildContext context) => LeySelectionMenuPage(),
            '/estatutos': (BuildContext context) => EstatutosMenuPage(),
            '/constvariados': (BuildContext context) =>
                TestConstitucionVariadosPage(),
            '/constitulos': (BuildContext context) => TestTitulosPage(),
            '/generate': (BuildContext context) => TitleGenerateTestPage(),
            '/quizpreview': (BuildContext context) => QuizPreviewPage(),
            '/paywall': (BuildContext context) => PaywallPage(),
            '/finaltest': (BuildContext context) => TestFinalResult(),
            '/revision': (BuildContext context) => RevisionPage(),
            '/generalGen': (BuildContext context) => GeneralGenerateTestPage(),
            '/stat': (BuildContext context) => HomeScreen(),
            '/custom': (BuildContext context) => CustomExamPage(),
            '/errors': (BuildContext context) => ErrorTestGenerationPage(),

            //'/home': (BuildContext context) => const HomePage(),
          }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
