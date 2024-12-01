// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stray_nest/widgets/screensize.dart';

class CustomButton extends StatefulWidget {
  final String text;

  final String routeName;

  CustomButton({required this.text, required this.routeName});
  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          isPressed = false;
        });
        _navigateToRoute(context);
      },
      onTapCancel: () {
        setState(() {
          isPressed = false;
        });
      },
      child: Container(
        height: ScreenSize.height(context) * 0.0675,
        width: ScreenSize.width(context) * 0.83,
        decoration: BoxDecoration(
          // border: Border.all(
          //   color: Color.fromARGB(255, 17, 136, 68),
          //   width: 2.0,
          // ),
          borderRadius: BorderRadius.circular(10),
          color:Color.fromARGB(255, 246, 146, 70)
              
        ),
        child: Center(
          child: Text(
            widget.text,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color:
                    Color.fromARGB(255, 246, 237, 237)
                    ,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToRoute(BuildContext context) {
    if (widget.routeName.isNotEmpty) {
      Navigator.of(context).pushNamed(widget.routeName);
    }
  }
}
