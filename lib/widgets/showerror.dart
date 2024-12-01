import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void showErrorMessage(context, String message) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          title: Center(
            child: Text(
              'ERROR!',
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          content: Text(
            message,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: Color.fromARGB(
                    255, 91, 90, 90), // You can customize the text color
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK',
                  style: TextStyle(
                      color: Color.fromARGB(255, 17, 136, 68), fontSize: 18)),
            )
          ]);
    },
  );
}
