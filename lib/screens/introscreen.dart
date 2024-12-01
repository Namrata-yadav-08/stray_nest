import 'package:flutter/material.dart';
import 'package:stray_nest/widgets/CustomButton.dart';
import 'package:stray_nest/widgets/screensize.dart';
import 'package:google_fonts/google_fonts.dart';

class Intro_Screen extends StatefulWidget {
  const Intro_Screen({super.key});

  @override
  State<Intro_Screen> createState() => _Intro_ScreenState();
}

class _Intro_ScreenState extends State<Intro_Screen> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Stack(
        children: [Container(
              height: ScreenSize.height(context) * 1,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/Start Screen (1).jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          Center(
            child: Column(
            children: [
              SizedBox(height: ScreenSize.height(context) * 0.6,),
              Container(
                margin: EdgeInsets.only(top: ScreenSize.height(context) * 0),
                child: Text(
                  'Happiness is closer ',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: Color.fromARGB(255, 248, 248, 248),
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
               Container(
                margin: EdgeInsets.only(top: ScreenSize.height(context) * 0.01),
                child: Text(
                  'than you think',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: Color.fromARGB(255, 248, 248, 248),
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              
              SizedBox(
                height: ScreenSize.height(context) * 0.05625,
              ),
              CustomButton(text: 'Sign In', routeName: 'signin'),
              SizedBox(
                height: ScreenSize.height(context) * 0.02,
              ),
              CustomButton(
                text: 'Sign Up',
                routeName: 'signup',
              ),
            ],
                    ),
          ),]
      ),
    );
  }
}
