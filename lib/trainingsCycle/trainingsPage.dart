
import 'package:bisguide/Models/constats.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';




// ignore: must_be_immutable, camel_case_types
class TrainingsPage extends StatefulWidget {
   late String title;
   TrainingsPage({super.key,required this.title});

  @override
  State<TrainingsPage> createState() => _TrainingsPagePageState();
}

class _TrainingsPagePageState extends State<TrainingsPage> {
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
             Text(MyConstents.trainingsIntro,textDirection: TextDirection.rtl,style: TextStyle(color: _isDarkMode? Colors.white:Colors.black),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(crossAxisAlignment:CrossAxisAlignment.stretch,
                    children: [Center(child: Text(_isAr?'🎖️مركز الحساب العلمي':'🎖️Scientific Computation Center',style: TextStyle(fontSize: 16,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center
                    ,textDirection: TextDirection.rtl,
                    ),
                    ),
                      Text(MyConstents.centerDescriptions[0],textAlign: TextAlign.center,textDirection: TextDirection.rtl,),
                      
                        ],
                  ),
                ),),
              ),
             
             Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(crossAxisAlignment:CrossAxisAlignment.stretch,
                    children: [Center(child: Text(_isAr?'🎖️ المركز الجامعي للتطوير المهني:':'🎖️ University Center for Professional Development:',style: TextStyle(fontSize: 16,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center
                    ,textDirection: TextDirection.rtl,
                    ),
                    ),
                      Text(MyConstents.centerDescriptions[1],textAlign: TextAlign.center,textDirection: TextDirection.rtl,),
                      
                        ],
                  ),
                ),
                ),

              ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(crossAxisAlignment:CrossAxisAlignment.stretch,
                    children: [Center(child: Text(_isAr?'🎖️ مركز الخدمة العامة:':'🎖️ Public Service Center:',style: TextStyle(fontSize: 16,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center
                    ,textDirection: TextDirection.rtl,
                    ),
                    ),
                      Text(MyConstents.centerDescriptions[2],textAlign: TextAlign.center,textDirection: TextDirection.rtl,),
                      
                        ],
                  ),
                ),
                ),

              ),
              
             ],),
            ),
            
            
          ),
          ),
    );
  }
}