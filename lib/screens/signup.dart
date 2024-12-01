// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//  import 'package:stray_nest/widgets/Header.dart';
//  import 'package:stray_nest/widgets/footer.dart';
//   import 'package:stray_nest/widgets/inputFields.dart';
//  import 'package:stray_nest/widgets/screensize.dart';
//  import 'package:stray_nest/widgets/showerror.dart';

// class SignUp extends StatefulWidget {
//   const SignUp({
//     super.key,
//     required void Function() onTap,
//   });

//   @override
//   State<SignUp> createState() => _SignUpState();
// }

// class _SignUpState extends State<SignUp> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController usernameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   void usersignup() async {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return const Center(
//           child: CircularProgressIndicator(),
//         );
//       },
//     );
//     try {
//       await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: usernameController.text,
//         password: passwordController.text,
//       );
//       showdialog(context);
//       Navigator.pushNamed(context, 'signin');
//       Navigator.of(context).pop();
//     } on FirebaseAuthException catch (e) {
//       Navigator.pop(context);
//       showErrorMessage(context, e.code);
//     }
//     // final userCredential =
//     //     await FirebaseAuth.instance.createUserWithEmailAndPassword(
//     //   email: emailController.text,
//     //   password: passwordController.text,
//     // );
//     // showdialog(context);
//     // Navigator.pushNamed(context, 'signin');
//     // Navigator.of(context).pop();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Expanded(
//         child: Column(
//           children: [
//             Header(
//               text1: 'Sign Up',
//               text2: 'Create your new account',
//             ),
//             CustomInputField(
//               hintText: 'First and last name',
//               icon: Icons.person_outline,
//               controller: nameController,
//             ),
//             SizedBox(
//               height: ScreenSize.height(context) * 0.02,
//             ),
//             CustomInputField(
//               hintText: 'Username',
//               icon: Icons.person,
//               controller: usernameController,
//             ),
//             SizedBox(
//               height: ScreenSize.height(context) * 0.02,
//             ),
//             CustomInputField(
//               hintText: 'Email',
//               icon: Icons.mail,
//               controller: emailController,
//             ),
//             SizedBox(
//               height: ScreenSize.height(context) * 0.02,
//             ),
//             CustomInputField(
//               hintText: 'Password',
//               icon: Icons.lock,
//               controller: passwordController,
//             ),
//             SizedBox(
//               height: ScreenSize.height(context) * 0.0275,
//             ),
//             Footer(
//               text3: 'Sign Up',
//               onPressed: () {
//                 String uname = usernameController.text.toString();
//                 String password = passwordController.text.toString();
//                 usersignup();
//               },
//               text4: "Already have an account?",
//               text5: 'Sign In',
//               routeName: 'signin',
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// void showdialog(BuildContext context) {
//   showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           backgroundColor: const Color.fromARGB(255, 255, 255, 255),
//           title: Center(
//             child: Text(
//               'You are REGISTERED!!',
//               style: GoogleFonts.poppins(
//                 textStyle: const TextStyle(
//                   color: Colors.black,
//                   fontSize: 20,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ),
//           ),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 Navigator.pushNamed(context, 'signin');
//               },
//               child: Text('OK',
//                   style: TextStyle(
//                       color:Color.fromARGB(255, 246, 146, 70), fontSize: 18)),
//             ),
//           ],
//         );
//       });
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stray_nest/widgets/Header.dart';
import 'package:stray_nest/widgets/footer.dart';
import 'package:stray_nest/widgets/inputFields.dart';
import 'package:stray_nest/widgets/screensize.dart';
import 'package:stray_nest/widgets/showerror.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Method to handle sign up
  void usersignup() async {
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
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      Navigator.pop(context); // Close the loader dialog
      showdialog(context); // Show registration success dialog
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
          children: [
            Header(
              text1: 'Sign Up',
              text2: 'Create your new account',
            ),
            CustomInputField(
              hintText: 'First and last name',
              icon: Icons.person_outline,
              controller: nameController,
            ),
            SizedBox(
              height: ScreenSize.height(context) * 0.02,
            ),
            CustomInputField(
              hintText: 'Username',
              icon: Icons.person,
              controller: usernameController,
            ),
            SizedBox(
              height: ScreenSize.height(context) * 0.02,
            ),
            CustomInputField(
              hintText: 'Email',
              icon: Icons.mail,
              controller: emailController,
            ),
            SizedBox(
              height: ScreenSize.height(context) * 0.02,
            ),
            CustomInputField(
              hintText: 'Password',
              icon: Icons.lock,
              controller: passwordController,
            ),
            SizedBox(
              height: ScreenSize.height(context) * 0.0275,
            ),
            Footer(
              text3: 'Sign Up',
              onPressed: usersignup,
              text4: "Already have an account?",
              text5: 'Sign In',
              routeName: 'signin',
            ),
          ],
        ),
      ),
    );
  }
}

// Updated showdialog function
void showdialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Center(
          child: Text(
            'You are REGISTERED!!',
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, 'signin');
            },
            child: Text(
              'OK',
              style: TextStyle(
                  color: Color.fromARGB(255, 246, 146, 70), fontSize: 18),
            ),
          ),
        ],
      );
    },
  );
}
