import 'package:bisguide/Models/constats.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable, camel_case_types
class simestersSubjectView extends StatefulWidget {
   late String title;
   simestersSubjectView({super.key,required this.title});

  @override
  State<simestersSubjectView> createState() => _simestersSubjectViewState();
}

class _simestersSubjectViewState extends State<simestersSubjectView> {
  List<Widget> generateSubjects(int year, int simester){
    List<Widget> res = [];
    for(int i = 0; i < MyConstents.subjects[year][simester].length;i++){
      res.add (Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        child: Title(color: Colors.black,
        child: Text(MyConstents.subjects[year][simester][i],style: TextStyle(fontSize: 24),textAlign: TextAlign.end,),),
      ));
    }
    return res;
   }
   bool _isDarkMode = false;

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
      final studyYear args = ModalRoute.of(context)!.settings.arguments as studyYear;

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
          padding:EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical: 32,horizontal: 16)
              ,child: Card(color: Colors.white,
              child: Column(children: generateSubjects(args.year,args.simester),crossAxisAlignment: CrossAxisAlignment.end,),
              ),
              ),
            ),
            ),
        ),
    );
  }
}