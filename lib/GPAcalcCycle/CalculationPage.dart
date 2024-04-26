import 'package:bisguide/Models/constats.dart';
import 'package:bisguide/SubWidgets/gpaCell.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CalculationPage extends StatefulWidget {
  const CalculationPage({super.key});

  @override
  _CalculationPage createState() => _CalculationPage();
}

class _CalculationPage extends State<CalculationPage> {
  List<GpacCell> widgetsList = []; // List to hold dynamically added widgets
  int counter = 0;

  String totalText = '0';

  double calcGPA() {
    double res = 0;
    double points = 0, hrs = 0;
    for (int i = 0; i < widgetsList.length; i++) {
      points += widgetsList[i].getMult();
      hrs += widgetsList[i].subject.hours;
    }
    res = points / hrs;
    setState(() {
      totalText = res.toStringAsFixed(3);
    });
    return res;
  }

  bool _isDarkMode = false;
  bool _isAr = MyConstents.language == 'ar';

  void _loadDarkMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkMode = prefs.getBool('is_dark_mode') ?? false;
      print(_isDarkMode);
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
    String title =
        (ModalRoute.of(context)!.settings.arguments as List<String>)[0];
    String type =
        (ModalRoute.of(context)!.settings.arguments as List<String>)[1];

    return Scaffold(
      backgroundColor:
          _isDarkMode ? Color.fromRGBO(40, 55, 57, 1) : Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor:
            _isDarkMode ? Colors.black54 : const Color.fromRGBO(40, 55, 57, 1),
        title: Text(title,
            style: TextStyle(color: _isDarkMode ? Colors.white : Colors.white)),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white, // Change the back button color here
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
              Icons.home,
              color: Colors.white, // Change the home button color here
            ),
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 32, 8, 32),
        child: Center(
          child: Card(
            child: SizedBox(
              height: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  counter > 0
                      ? Expanded(
                          child: ListView.builder(
                            itemCount: widgetsList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return widgetsList[index];
                            },
                          ),
                        )
                      : Center(
                          child: Title(
                            color: Colors.black,
                            child: Text(
                              _isAr ? 'برجاء اضافة حقول' : 'Add More Fields',
                              style: TextStyle(fontSize: 32),
                            ),
                          ),
                        ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.redAccent)),
                          onPressed: () {
                            // Add a new Text widget to the list
                            setState(() {
                              if (counter > 0) {
                                widgetsList.removeLast();
                                counter -= 1;
                              }
                            });
                          },
                          child: const Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Add a new Text widget to the list
                            setState(() {
                              if (counter < 8) {
                                widgetsList.add(GpacCell(type: type));
                                counter++;
                              }
                            });
                          },
                          child: Text(_isAr ? 'اضافة حقل جديد' : 'New Field'),
                        ),
                        SizedBox(
                          width: 100,
                          child: ElevatedButton(
                            onPressed: () {
                              calcGPA();
                            },
                            child: Text(_isAr ? 'حساب' : 'calculate'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Title(
                          color: Colors.black,
                          child:
                              Text(totalText, style: TextStyle(fontSize: 24)),
                        ),
                        Title(
                          color: Colors.black,
                          child: Text(
                            _isAr ? 'النتيجه' : 'Result',
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
