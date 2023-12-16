import 'package:flutter/material.dart';
import 'package:tech_newa_flutter_app/Movies%20App/home_Screen.dart';
import 'package:tech_newa_flutter_app/main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor:Colors.green,// Set brigh
        // tness to light
        primarySwatch: Colors.green, // Set primary color to blue
        // textTheme: TextTheme(
        //   titleSmall:TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blue),
        //   titleMedium:TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),
        //   titleLarge:TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
        //
        //   // Define text styles
        //   headline4: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.blue),
        //   headline3: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.blue),
        //   headline2: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
        //   headline1: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
        //   // Titles and subtitles
        //
        //   // subtitle1: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        //   subtitle2: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.blue),
        //   subtitle1: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.blue),
        //   // Other text styles as needed
        // ),
      ),
      home:Home() ,
    );
  }
}
