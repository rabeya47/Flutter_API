
import 'package:flutter/material.dart';
import 'package:flutter_api/constants/routes.dart';
import 'package:flutter_api/views/homepage.dart';
import 'package:flutter_api/views/registration.dart';

import 'login.dart';
import 'homepage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,

    initialRoute: Routes.homepage,
    routes: {
      Routes.registration: (context) => Registration(),
      Routes.login: (context) => Login(),
      Routes.homepage: (context) => HomePage(),


    },
  ));
}