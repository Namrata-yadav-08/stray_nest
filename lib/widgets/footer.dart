import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stray_nest/widgets/screensize.dart';

class Footer extends StatelessWidget {
  final String text3;
  final VoidCallback onPressed;
  final String text4;
  final String text5;
  final String routeName;

  const Footer({
    super.key,
    required this.text3,
    required this.onPressed,
    required this.text4,
    required this.text5,
    required this.routeName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: ScreenSize.height(context) * 0.0675,
          width: ScreenSize.width(context) * 0.833,
          decoration: BoxDecoration(
              color:Color.fromARGB(255, 246, 146, 70),
              borderRadius: BorderRadius.circular(10)),
          child: TextButton(
            child: Text(
              text3,
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            onPressed: onPressed,
          ),
        ),
        SizedBox(
          height: ScreenSize.height(context) * 0.03,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text4,
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  color: Color.fromARGB(255, 95, 97, 96),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, routeName);
              },
              child: Text(
                text5,
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    color: Color.fromARGB(255, 246, 146, 70),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
