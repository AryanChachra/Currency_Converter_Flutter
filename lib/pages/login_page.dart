import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/routes.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // moveToHome(BuildContext context) async {
  //   await Future.delayed(Duration(seconds:2));
  //   await Navigator.pushNamed(context, MyRoutes.homeRoute);
  // }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              Image.asset("assets/images/login.png",fit: BoxFit.fill,),
              SizedBox(height: 60
              ),
              Text(
                "Welcome to Currency Converter",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(onPressed:(){
                // print('Lets wait for some action');
                Navigator.pushNamed(context, MyRoutes.homeRoute);
              },
                child: Text(
                "Let's Convert", style: TextStyle(color: Colors.black),
              ),style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, elevation: 5,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
              ),
              SizedBox(
                height: 200,
              ),
              Text(
                "Made with Flutter by Aryan",style: TextStyle(fontSize: 15,fontFamily: GoogleFonts.lato().fontFamily, ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
