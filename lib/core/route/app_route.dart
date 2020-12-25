import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:green_dhaka/constraint/color.dart';
import 'package:green_dhaka/login/login.dart';
import 'package:green_dhaka/registration/registration.dart';
import 'package:green_dhaka/view/screens/home/home_page.dart';

class AppRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Green Dhaka',
      theme: ThemeData().copyWith(
        primaryColor: MyColor.primary,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: LoginScreen.PATH,
      routes: {
        LoginScreen.PATH: (context) => HomePage(),
        Registration.PATH: (context) => Registration(),
        HomePage.path :(context) => HomePage()
      },
    );
  }
}


