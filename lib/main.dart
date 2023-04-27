import 'package:flutter/material.dart';
import 'package:ifind_backend/authscreens/login.dart';
import 'package:ifind_backend/authscreens/signup.dart';
import 'package:ifind_backend/authscreens/landing.dart';
import 'package:ifind_backend/screens/jobPost.dart';
import 'package:ifind_backend/screens/lostPost.dart';
import 'package:ifind_backend/screens/profile_upload.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/login': (context) => Login(),
      '/landing': (context) => Landing(),
      '/profile': (context) => Profile(),
      '/signup': (context) => Signup(),
      '/postlost': (context) => Post(),
      '/': (context) => JobPost(),

    },
  ));
}