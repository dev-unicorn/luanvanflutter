import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constants {
  static String myName = "";
  static String myEmail = "";
  static String nickname = "";
}

class Photo {
  final String photo;

  Photo(this.photo);
}

const textInputDecoration = InputDecoration(
  fillColor: Colors.blueGrey,
  filled: true,
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blueGrey, width: 2.0)),
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blueGrey, width: 2.0)),
);

const kSpacingUnit = 10;
const kPrimaryDarkColor = Color(0xFF373737);
const kPrimaryColor = Color(0xFFFFAFBD);
const kSecondaryColor = Color(0xFFFFC3A0);
//const kPrimaryColor = Color(0xFF6F35A5);
const kPrimaryLightColor = Color(0xFFFDE1E5);
const kContentColorLightTheme = Color(0xFF1D1D35);
const kContentColorDarkTheme = Color(0xFFF5FCF9);
const kWarninngColor = Color(0xFFF3BB1C);
const kErrorColor = Color(0xFFF03738);

const kDefaultPadding = 20.0;


class FadeRoute extends PageRouteBuilder {
  final Widget page;
  FadeRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) => page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) => FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
