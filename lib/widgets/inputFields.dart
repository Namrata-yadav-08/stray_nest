import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stray_nest/widgets/screensize.dart';

class CustomInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController controller;

  const CustomInputField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: ScreenSize.height(context) * 0.0625,
        width: ScreenSize.width(context) * 0.833,
        child: TextField(
          controller: controller,
          obscureText: hintText.toLowerCase() == 'password',
          obscuringCharacter: '*',
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              color: Color.fromARGB(
                  255, 91, 90, 90), // You can customize the text color
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          decoration: InputDecoration(
              fillColor:Color.fromARGB(102, 246, 146, 70),
              filled: true,
              hintText: hintText,
              hintStyle: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Color.fromARGB(
                      255, 91, 90, 90), // You can customize the text color
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              prefixIcon: Icon(
                icon,
                color: Color.fromARGB(255, 246, 146, 70),
                size: 16,
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 246, 146, 70), width: 2),
                  borderRadius: BorderRadius.circular(10)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.white),
              )),
        ),
      ),
    );
  }
}
