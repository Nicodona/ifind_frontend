import 'package:flutter/material.dart';
import 'package:ifind_backend/authscreens/login.dart';
import 'package:ifind_backend/authscreens/signup.dart';
import 'package:ifind_backend/authscreens/landing.dart';
import 'package:ifind_backend/screens/profile_upload.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/login': (context) => Login(),
      '/land': (context) => Landing(),
      '/': (context) => Profile(),
      '/signup': (context) => Signup(),

    },
  ));
}