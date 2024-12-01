// import 'dart:ui';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:stray_nest/widgets/Header.dart';
// import 'package:stray_nest/widgets/footer.dart';
// import 'package:stray_nest/widgets/inputFields.dart';
// import 'package:stray_nest/widgets/screensize.dart';
// import 'package:stray_nest/widgets/showerror.dart';

// class SignIn extends StatefulWidget {
//   const SignIn({
//     super.key,
//     required void Function() onTap,
//   });

//   @override
//   State<SignIn> createState() => _SignInState();
// }

// class _SignInState extends State<SignIn> {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();

//   void signuserin() async {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return const Center(
//           child: CircularProgressIndicator(),
//         );
//       },
//     );
//     try {
//       await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: emailController.text,
//         password: passwordController.text,
//       );
//       Navigator.pop(context);
//       Navigator.pushNamed(context, 'nav');
//     } on FirebaseAuthException catch (e) {
//       Navigator.pop(context);
//       showErrorMessage(context, e.code);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white,
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Header(
//               text1: 'Sign In',
//               text2: 'Log in to your account',
//             ),
//             CustomInputField(
//               hintText: 'Email',
//               icon: Icons.email,
//               controller: emailController,
//             ),
//             SizedBox(
//               height: ScreenSize.height(context) * 0.0225,
//             ),
//             CustomInputField(
//               hintText: 'Password',
//               icon: Icons.lock,
//               controller: passwordController,
//             ),
//             SizedBox(
//               height: ScreenSize.height(context) * 0.025,
//             ),
//             Padding(
//               padding: EdgeInsets.only(left: ScreenSize.width(context) * 0.561),
//               child: TextButton(
//                   onPressed: () {
//                     Navigator.pushNamed(context, 'forgetpass');
//                   },
//                   child: Text('Forget password ?',
//                       style: GoogleFonts.poppins(
//                           textStyle: const TextStyle(
//                         color: Color.fromARGB(255, 1, 1, 1),
//                         fontSize: 14,
//                         fontWeight: FontWeight.w400,
//                       )))),
//             ),
//             SizedBox(
//               height: ScreenSize.height(context) * 0.045,
//             ),
//             Footer(
//               text3: 'Sign In',
//               onPressed: () {
//                 String email = emailController.text.toString();
//                 String password = passwordController.text.toString();
//                  signuserin();
//               },
//               text4: "Don't have an account?",
//               text5: 'Sign Up',
//               routeName: 'signup',
//             )
//           ],
//         ));
//   }
// }
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stray_nest/widgets/Header.dart';
import 'package:stray_nest/widgets/footer.dart';
import 'package:stray_nest/widgets/inputFields.dart';
import 'package:stray_nest/widgets/screensize.dart';
import 'package:stray_nest/widgets/showerror.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Method to handle sign in
  void signuserin() async {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissing the dialog by tapping outside
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      Navigator.pop(context); // Close the loader dialog
      Navigator.pushNamed(context, 'nav'); // Navigate to next screen
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context); // Close the loader dialog
      showErrorMessage(context, e.message ?? "An unknown error occurred.");
    } catch (e) {
      Navigator.pop(context); // Close the loader dialog
      showErrorMessage(context, "Something went wrong. Please try again.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(
              text1: 'Sign In',
              text2: 'Log in to your account',
            ),
            CustomInputField(
              hintText: 'Email',
              icon: Icons.email,
              controller: emailController,
            ),
            SizedBox(
              height: ScreenSize.height(context) * 0.0225,
            ),
            CustomInputField(
              hintText: 'Password',
              icon: Icons.lock,
              controller: passwordController,
            ),
            SizedBox(
              height: ScreenSize.height(context) * 0.025,
            ),
            Padding(
              padding: EdgeInsets.only(left: ScreenSize.width(context) * 0.561),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'forgetpass');
                },
                child: Text(
                  'Forget password?',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: Color.fromARGB(255, 1, 1, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: ScreenSize.height(context) * 0.045,
            ),
            Footer(
              text3: 'Sign In',
              onPressed: signuserin,
              text4: "Don't have an account?",
              text5: 'Sign Up',
              routeName: 'signup',
            ),
          ],
        ),
      ),
    );
  }
}
