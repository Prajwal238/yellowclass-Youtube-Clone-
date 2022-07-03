import 'package:flutter/material.dart';
import 'package:yellow_page_assignment/Constants/constants.dart';
import 'package:yellow_page_assignment/HomePageScreen/bottom_tabs.dart';
import 'package:yellow_page_assignment/HomePageScreen/youtube_homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yellow Class',
      theme: ThemeData(
        primaryColor: ytcolor,
      ),
      initialRoute: '/',
      routes: {
        '/':(context) => const BottomTabs()
      },
    );
  }
}