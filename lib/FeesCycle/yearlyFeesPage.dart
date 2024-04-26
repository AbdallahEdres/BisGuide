import 'package:bisguide/Models/constats.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';



// ignore: must_be_immutable, camel_case_types
class YearlyFeesPage extends StatefulWidget {
   late String title;
   YearlyFeesPage({super.key,required this.title});

  @override
  State<YearlyFeesPage> createState() => _YearlyFeesPageState();
}

class _YearlyFeesPageState extends State<YearlyFeesPage> {
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
late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/myvideo.mp4')
      ..initialize().then((_) {
        setState(() { _loadDarkMode();
});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
  _launchURL() async {
   final Uri url = Uri.parse('https://tdb.tanta.edu.eg/regart/');
   if (!await launchUrl(url)) {
        throw Exception('Could not launch ');
    }
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
          padding:EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical: 32,horizontal: 16)
              ,child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(crossAxisAlignment:CrossAxisAlignment.stretch,
                      children: [
                        Text(MyConstents.fees[0],textAlign: TextAlign.right,textDirection: TextDirection.rtl,),
                         Center(
                           child: TextButton(child: Text(_isAr?'اضغط هنا':'Press Here'),onPressed: () {
                            _launchURL();
                            },
                           ),
                         ),
                        Text(MyConstents.fees[2],textAlign: TextAlign.right,textDirection: TextDirection.rtl,),
                        Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : CircularProgressIndicator(),
      ),
      ElevatedButton(
        onPressed: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
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
                        Text(MyConstents.fees[3],textAlign: TextAlign.right,textDirection: TextDirection.rtl,),
                      ],
                    ),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(MyConstents.fees[4],textAlign: TextAlign.right,textDirection: TextDirection.rtl,),
                  )),
                ),
              ],),
              ),
            ),
            ),
        ),
    );
  }
}