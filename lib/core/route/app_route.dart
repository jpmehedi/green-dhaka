import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:green_dhaka/constraint/color.dart';
import 'package:green_dhaka/home/home_page.dart';
import 'package:green_dhaka/login/login.dart';
import 'package:green_dhaka/registration/registration.dart';

class AppRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//      systemNavigationBarColor: MyColor.primary,
//      statusBarColor: MyColor.primary,
//      statusBarIconBrightness: Brightness.light,
//      systemNavigationBarIconBrightness: Brightness.dark,
//    ));
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
        LoginScreen.PATH: (context) => LoginScreen(),
        Registration.PATH: (context) => Registration(),
        HomePage.path :(context) => HomePage()
      },
    );
  }
}

//class AppRoutes {
//  static Map<String, WidgetBuilder> configureRoute() {
//    return {
//      LoginScreen.PATH: (context) => LoginScreen(),
//    };
//  }
//}
