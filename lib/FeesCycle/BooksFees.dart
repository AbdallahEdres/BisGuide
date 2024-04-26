
import 'package:bisguide/Models/constats.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';



// ignore: must_be_immutable, camel_case_types
class BooksFees extends StatefulWidget {
   late String title;
   BooksFees({super.key,required this.title});

  @override
  State<BooksFees> createState() => _BooksFeesPageState();
}

class _BooksFeesPageState extends State<BooksFees> {
  bool _isAr = MyConstents.language == 'ar';

  launchURL(String urlString) async {
   final Uri url = Uri.parse(urlString);
   if (!await launchUrl(url)) {
        throw Exception('Could not launch ');
    }
}
bool _isDarkMode = false;

   void _loadDarkMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkMode = prefs.getBool('is_dark_mode') ?? false;
      print(_isDarkMode);
    });
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
                    children: [
                      Text(MyConstents.booksFees[0],textAlign: TextAlign.right,textDirection: TextDirection.rtl,),
                       Center(
                         child: TextButton(child:  Text(_isAr?'اضغط هنا':'Press Here'),onPressed: () {
                          launchURL('https://tdb.tanta.edu.eg/ebooks/');
                          },
                         ),
                       ),
                        ],
                  ),
                ),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(MyConstents.booksFees[1],textAlign: TextAlign.right,textDirection: TextDirection.rtl,),
                    ],
                  ),
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(MyConstents.booksFees[2],textAlign: TextAlign.right,textDirection: TextDirection.rtl,),
                       Center(
                         child: TextButton(child:  Text(_isAr?'اضغط هنا':'Press Here'),onPressed: () {
                          launchURL('http://tdb2.tanta.edu.eg/paymentgateway/e_payment/');
                          },
                         ),
                       ),
                    ],
                  ),
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(MyConstents.booksFees[3],textAlign: TextAlign.right,textDirection: TextDirection.rtl,),
                ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(child: Column(
                    children: [ Center(child: Text(_isAr?'ملاحظات':'Notes',style: TextStyle(fontSize: 24),),),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(MyConstents.booksFees[4],textAlign: TextAlign.right,textDirection: TextDirection.rtl,),
                      ),
                      Center(
                         child: TextButton(child:  Text(_isAr?'اضغط هنا':'Press Here'),onPressed: () {
                          launchURL('https://www.youtube.com/watch?v=5DdLVMxTwV0');
                          },
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Text(MyConstents.booksFees[5],textAlign: TextAlign.right,textDirection: TextDirection.rtl,),
                       ),
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Text(MyConstents.booksFees[6],textAlign: TextAlign.right,textDirection: TextDirection.rtl,),
                       ),
                       Center(
                         child: TextButton(child:  Text(_isAr?'اضغط هنا':'Press Here'),onPressed: () {
                          launchURL('https://tdb.tanta.edu.eg/newemailservices/pw_reset.aspx');
                          },
                         ),
                       ),
                    ],
                  )),
                ),
            ],),
            ),
            
          ),
          ),
    );
  }
}