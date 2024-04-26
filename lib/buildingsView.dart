import 'package:bisguide/Models/constats.dart';
import 'package:flutter/material.dart';
import 'package:bisguide/SubWidgets/card.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable, camel_case_types
class buildingsView extends StatefulWidget {
   String title;
   buildingsView({super.key,required this.title});

  @override
  State<buildingsView> createState() => _buildingsViewState();
}

class _buildingsViewState extends State<buildingsView> {
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
      
        body: Padding(
        padding:const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MainCard(
                    title: _isAr ? 'معمل الحاسب الالي' : 'Computer lab' ,
                    routeName: '',
                    imagePath:'assets/about.jpg' ,
                    icon: Icons.abc,
                  ),
                   MainCard(
                    title: _isAr? 'مبني نظم معلومات الاعمال': '(ERP) Building',
                    routeName: '',
                    imagePath: 'assets/fileds.jpg',
                    icon: Icons.abc,
                  ),
                ],
              ),
             Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MainCard(
                    title: _isAr? 'مبنى العميد' : 'Dean Building',
                    routeName: '',
                    imagePath:'assets/criditHours.jpg' ,
                    icon: Icons.abc,
                  ),
                   MainCard(
                    title: _isAr?'مبني المعامل':'Labs Building',
                    routeName: '',
                    imagePath: 'assets/fileds.jpg',
                    icon: Icons.abc,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MainCard(
                    title:_isAr? 'المكتبة': 'Library',
                    routeName: '',
                    imagePath:'assets/criditHours.jpg' ,
                    icon: Icons.abc,
                  ),
                   MainCard(
                    title:_isAr? 'مبنى تكنولوجيا المعلومات' :'IT Building',
                    routeName: '',
                    imagePath: 'assets/fileds.jpg',
                    icon: Icons.abc,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MainCard(
                    title: _isAr? 'الخزينة': 'bursar\'s office',
                    routeName: '',
                    imagePath:'assets/criditHours.jpg' ,
                    icon: Icons.abc,
                  ),
                   MainCard(
                    title: _isAr? 'اتحاد الطلاب' :'Students Union',
                    routeName: '',
                    imagePath: 'assets/fileds.jpg',
                    icon: Icons.abc,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MainCard(
                    title: _isAr ? 'شئون الطلبة' : 'students Affairs',
                    routeName: '',
                    imagePath:'assets/criditHours.jpg' ,
                    icon: Icons.abc,
                  ),
                   MainCard(
                    title: _isAr ? 'مبنى الدراسات العليا' : 'Graduate Studies Building',
                    routeName: '',
                    imagePath: 'assets/fileds.jpg',
                    icon: Icons.abc,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MainCard(
                    title:_isAr? 'الكافيتريا' : 'Cafeteria',
                    routeName: '',
                    imagePath:'assets/criditHours.jpg' ,
                    icon: Icons.abc,
                  ),
                   
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}