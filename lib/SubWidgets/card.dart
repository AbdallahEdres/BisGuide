// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  String title = '';
  String routeName;
  String imagePath;
  IconData icon;
  

  MainCard({super.key, required this.title, required this.routeName,required this.imagePath,required this.icon});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 160,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, routeName);
        },
        child: Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [ 
                   SizedBox(height: 100,
                     child: Icon(icon,size: 90,color: const Color.fromRGBO(40, 57, 55, 1),),
                   ),
                  Center(child: FittedBox(
                    child: FittedBox(
                      child: Title(color: Colors.black, child: Text(title,style: 
                      const TextStyle(fontSize: 14),textAlign: TextAlign.center,)),
                    ),
                  ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MainCardWithImage extends StatelessWidget {
  String title = '';
  String routeName;
  String imagePath;
  IconData icon;
  

  MainCardWithImage({super.key, required this.title, required this.routeName,required this.imagePath,required this.icon});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 150,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, routeName);
        },
        child: Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [ 
                   SizedBox(height: 100,
                     child: Image.asset(imagePath),
                   ),
                  Center(child: FittedBox(
                    child: FittedBox(
                      child: Title(color: Colors.black, child: Text(title,style: 
                      const TextStyle(fontSize: 14),textAlign: TextAlign.center,)),
                    ),
                  ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
