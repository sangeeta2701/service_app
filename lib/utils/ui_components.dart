import 'package:flutter/material.dart';
import 'package:service_app/utils/constants.dart';


class UIComponents{
   static void showSnackBar(BuildContext context, String text, Duration d) {
    ScaffoldMessenger.of(context)..removeCurrentSnackBar()..showSnackBar(SnackBar(backgroundColor: appUiThemeColor, content: Text(text,style: TextStyle(color: Colors.white)),behavior: SnackBarBehavior.floating, duration: d,));
  }
}