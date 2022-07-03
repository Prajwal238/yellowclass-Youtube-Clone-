import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

const List<String> category = [
    "All",
    "Music",
    "Entertainment",
    "Gaming",
    "Sports",
    "Computer Science",
    "Flutter"
  ];
TextStyle defaultTextStyle = GoogleFonts.roboto(color: Colors.white); 
const ytcolor = Color(0xff282828);
const ytbgcolor = Color.fromARGB(255, 88, 88, 88);
const tabunselected = Color.fromARGB(255, 56, 56, 56);
const screencast = Icon(Icons.cast_sharp);
const notification = FaIcon(FontAwesomeIcons.bell);
const search = Icon(Icons.search_sharp);
const home = Icon(Icons.home);
const shorts = Icon(Icons.theaters_outlined);
const subs = Icon(Icons.subscriptions_outlined);
const library = Icon(Icons.video_library_outlined);
const upload = FaIcon(
                    FontAwesomeIcons.circlePlus,
                    size: 40,
                  );
const profile = Icon(
  Icons.person_outline_sharp,
  color: Colors.white,
  size: 18,
);
