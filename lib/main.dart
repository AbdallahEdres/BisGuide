import 'package:bisguide/FeesCycle/BooksFees.dart';
import 'package:bisguide/FeesCycle/FeesTypePage.dart';
import 'package:bisguide/FeesCycle/yearlyFeesPage.dart';
import 'package:bisguide/GPAcalcCycle/CalculationPage.dart';
import 'package:bisguide/PapersCycle/PapersPage.dart';
import 'package:bisguide/StudentActivityCycle/StudentActivityPage.dart';
import 'package:bisguide/SubjectsCycle/SubjectsView.dart';
import 'package:bisguide/buildingsView.dart';
import 'package:bisguide/SubWidgets/card.dart';
import 'package:bisguide/Models/constats.dart';
import 'package:bisguide/GPAcalcCycle/gpaCalculator.dart';
import 'package:bisguide/imageWithTextView.dart';
import 'package:bisguide/SubjectsCycle/semisterSubjects.dart';
import 'package:bisguide/SubjectsCycle/simesters.dart';
import 'package:bisguide/trainingsCycle/trainingsPage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MyConstents.getLanguage();
  print(MyConstents.language);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(112, 112, 112, 1)),
        useMaterial3: true,
      ),
      home: MyHomePage(title: MyConstents.mainTitle),
      initialRoute: '/',
      routes: {
        //    '/': (context) => MyHomePage(title: 'الرئيسة'),
        '/about': (context) => ImageWithTextView(
              imagePath: 'assets/about.jpg',
              content: MyConstents.aboutContent,
              title: MyConstents.about,
            ),
        '/fileds': (context) => ImageWithTextView(
              imagePath: 'assets/workFields.png',
              content: MyConstents.workingFieldsContent,
              title: MyConstents.fileds,
            ),
        '/creditHours': (context) => ImageWithTextView(
              imagePath: 'assets/Gpa.jpeg',
              content: MyConstents.creditHoursContent,
              title: MyConstents.credithrs,
            ),
        '/buildings': (context) => buildingsView(
              title: MyConstents.buildings,
            ),
        '/subjects': (context) => SubjectsView(
              title: MyConstents.studySubjects,
            ),
        '/simesters': (context) => simestersView(
              title: MyConstents.chooseSimester,
            ),
        '/simestersSubjects': (context) => simestersSubjectView(
              title: MyConstents.subList,
            ),
        '/gpaCalculator': (context) =>
            GpaCalcualtor(title: MyConstents.calcgpa),
        '/CalculationPage': (context) => const CalculationPage(),
        '/FeesTypePage': (context) => FeesTypePage(
              title: MyConstents.feesAndPayments,
            ),
        '/YearlyFeesPage': (context) => YearlyFeesPage(
              title: MyConstents.fee,
            ),
        '/BooksFees': (context) => BooksFees(
              title: MyConstents.booksPayments,
            ),
        '/PapersPage': (context) => PapersPage(
              title: MyConstents.paperWorks,
            ),
        '/StudentActivityPage': (context) => StudentActivityPage(
              title: MyConstents.stactivities,
            ),
        '/TrainingsPage': (context) => TrainingsPage(
              title: MyConstents.trainings,
            ),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isDarkMode = false;

  void _loadDarkMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkMode = prefs.getBool('is_dark_mode') ?? false;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadDarkMode();
  }

  void _saveDarkMode(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_dark_mode', value);
  }

  @override
  Widget build(BuildContext context) {
    _loadDarkMode();
    return Scaffold(
      backgroundColor:
          _isDarkMode ? Color.fromRGBO(40, 55, 57, 1) : Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor:
            _isDarkMode ? Colors.black54 : const Color.fromRGBO(40, 55, 57, 1),
        title: Text(widget.title,
            style: TextStyle(color: _isDarkMode ? Colors.white : Colors.white)),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.dark_mode,
              color: Colors.white, // Change the home button color here
            ),
            onPressed: () {
              setState(() {
                _isDarkMode = !_isDarkMode;
                _saveDarkMode(_isDarkMode);
              });
            },
          ),
          IconButton(
            icon: Icon(
              Icons.language,
              color: Colors.white, // Change the home button color here
            ),
            onPressed: () {
              setState(() {
                if (MyConstents.language == 'ar') {
                  MyConstents.setLanguage('en');
                } else {
                  MyConstents.setLanguage('ar');
                }
                print(MyConstents.language);
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MainCard(
                      title: MyConstents.about,
                      routeName: '/about',
                      imagePath: 'assets/about.jpg',
                      icon: Icons.info,
                    ),
                    MainCard(
                      title: MyConstents.fileds,
                      routeName: '/fileds',
                      imagePath: 'assets/fileds.jpg',
                      icon: Icons.work,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MainCard(
                      title: MyConstents.creditSys,
                      routeName: '/creditHours',
                      imagePath: 'assets/criditHours.jpg',
                      icon: Icons.schedule,
                    ),
                    MainCard(
                      title: MyConstents.buildings,
                      routeName: '/buildings',
                      imagePath: 'assets/fileds.jpg',
                      icon: Icons.apartment,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MainCard(
                      title: MyConstents.studySubjects,
                      routeName: '/subjects',
                      imagePath: 'assets/criditHours.jpg',
                      icon: Icons.import_contacts,
                    ),
                    MainCard(
                      title: MyConstents.calcgpa,
                      routeName: '/gpaCalculator',
                      imagePath: 'assets/fileds.jpg',
                      icon: Icons.calculate,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MainCard(
                      title: MyConstents.feesAndPayments,
                      routeName: '/FeesTypePage',
                      imagePath: 'assets/fileds.jpg',
                      icon: Icons.payments,
                    ),
                    MainCard(
                      title: MyConstents.reqPapers,
                      routeName: '/PapersPage',
                      imagePath: 'assets/fileds.jpg',
                      icon: Icons.description,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MainCard(
                      title: MyConstents.stactivities,
                      routeName: '/StudentActivityPage',
                      imagePath: 'assets/fileds.jpg',
                      icon: Icons.local_activity,
                    ),
                    MainCard(
                      title: MyConstents.trainings,
                      routeName: '/TrainingsPage',
                      imagePath: 'assets/fileds.jpg',
                      icon: Icons.school,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
