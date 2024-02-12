import 'package:currency_converter/pages/home_page.dart';
import 'package:currency_converter/pages/login_page.dart';
import 'package:currency_converter/utils/routes.dart';
import 'package:flutter/material.dart';
import 'widgets/themes.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
    const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.loginRoute,
      routes: {
        "/":(context) =>LoginPage(),
        MyRoutes.homeRoute:(context)=>HomePage(),
        MyRoutes.loginRoute:(context)=>LoginPage(),
      },
    );
  }
}
