import 'package:bisguide/Models/constats.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable, camel_case_types
class FeesTypePage extends StatefulWidget {
   String title;
   FeesTypePage({super.key,required this.title});

  @override
  State<FeesTypePage> createState() => _FeesTypePageState();
}

class _FeesTypePageState extends State<FeesTypePage> {
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
    return Scaffold(backgroundColor: _isDarkMode? Color.fromRGBO(40, 55, 57, 1):Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor:_isDarkMode ?Colors.black54: const Color.fromRGBO(40, 55, 57, 1),
        title: Text(widget.title, style:  TextStyle(color: _isDarkMode? Colors.white:Colors.white)),leading: IconButton(
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
      
        body:  Center(
          child: Padding(
          padding:const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Padding(
              padding:  const EdgeInsets.symmetric(vertical: 32,horizontal: 16)
              ,child: Card(color: Colors.white,
              child: Column(children: [Padding(
                padding:   const EdgeInsets.symmetric(vertical: 16,horizontal: 32),
                child: FilledButton( style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(40, 57, 55, 1),
                ),
                ),onPressed:() => {Navigator.pushNamed(context, '/YearlyFeesPage')},
                 child:  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Icon(Icons.chevron_left),
                  Text(_isAr?'المصروفات':'Fees'),
                  ]),
                  ),
              ),
             Padding(
                padding:   const EdgeInsets.symmetric(vertical: 16,horizontal: 32),
                child: FilledButton( style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(40, 57, 55, 1),
                ),
                ),onPressed:() => {Navigator.pushNamed(context, '/BooksFees')},
                 child:  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [ Icon(Icons.chevron_left),
                  Text(_isAr?'الكتب':'Books'),
                  ]),
                  ),
              ),
                ],),
              ),
              ),
            ),
            ),
        ),
    );
  }
}