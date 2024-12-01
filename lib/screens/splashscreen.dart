// import 'dart:async';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:stray_nest/screens/introscreen.dart';

// import 'welcome_screeen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 146, 70),
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add your splash screen image or logo here
            Image.asset('assets/images/output-onlinetools-removebg-preview 1.png'),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Intro_Screen(),
          ));
    });
  }
}
