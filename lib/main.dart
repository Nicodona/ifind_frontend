import 'package:flutter/material.dart';
import 'package:ifind_backend/authscreens/login.dart';
import 'package:ifind_backend/authscreens/signup.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/login': (context) => Login(),
      '/': (context) => Signup(),

    },
  ));
}