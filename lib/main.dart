import 'package:basic_app_v2/Pages/login_page.dart';

import 'Pages/home_page.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(),
    home: const LoginScreen(),
  ));
}