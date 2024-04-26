
import 'package:bisguide/Models/constats.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



// ignore: must_be_immutable, camel_case_types
class PapersPage extends StatefulWidget {
   late String title;
   PapersPage({super.key,required this.title});

  @override
  State<PapersPage> createState() => _PapersPagePageState();
}

class _PapersPagePageState extends State<PapersPage> {
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
      
        body:  Padding(
        padding:const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Padding(
            padding:  const EdgeInsets.symmetric(vertical: 32,horizontal: 16)
            ,child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(crossAxisAlignment:CrossAxisAlignment.stretch,
                    children: [Center(child: Text(_isAr?'الاوراق المطلوبة للطلاب الجدد للتسجيل في القسم :\n' 
                                                      :'Documents required for new students to register in the department : \n',
                                                      style: TextStyle(fontSize: 16,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center
                    ,textDirection: TextDirection.rtl,
                    ),
                    ),
                      Text(MyConstents.requiredDocumentsForNewStudents,textAlign: TextAlign.right,textDirection: TextDirection.rtl,),
                      
                        ],
                  ),
                ),),
              ),
             
             Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(crossAxisAlignment:CrossAxisAlignment.stretch,
                    children: [Center(child: Text(_isAr?'الأوراق المطلوبة للتخرج من القسم :\n':'Documents required for graduation from the department:\n',style: TextStyle(fontSize: 16,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center
                    ,textDirection: TextDirection.rtl,
                    ),
                    ),
                      Text(MyConstents.requiredDocumentsForGraduation,textAlign: TextAlign.right,textDirection: TextDirection.rtl,),
                      
                        ],
                  ),
                ),),
              ),
             ],),
            ),
            
          ),
          ),
    );
  }
}