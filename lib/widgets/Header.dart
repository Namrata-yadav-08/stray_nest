import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stray_nest/widgets/screensize.dart';

class Header extends StatelessWidget {
  final String text1;
  final String text2;

  Header({
    super.key,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: ScreenSize.height(context) * 0.305,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: AssetImage('assets/images/Frame (7).png'))),
        ),
        SizedBox(
          height: ScreenSize.height(context) * 0.0225,
        ),
        Container(
            child: Text(
          text1,
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              color: Color.fromARGB(255, 246, 146, 70),
              fontSize: 36,
              fontWeight: FontWeight.w700,
            ),
          ),
        )),
        SizedBox(
          height: ScreenSize.height(context) * 0.0125,
        ),
        Container(
          child: Text(
            text2,
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                color: Color.fromARGB(255, 81, 81, 81),
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        SizedBox(
          height: ScreenSize.height(context) * 0.035,
        ),
      ],
    );
  }
}
