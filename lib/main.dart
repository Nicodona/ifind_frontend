import 'package:flutter/material.dart';
import 'package:ifind_backend/authscreens/login.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Login()
    },
  ));
}