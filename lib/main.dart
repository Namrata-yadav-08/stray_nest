import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'package:stray_nest/screens/LostFound.dart';
import 'package:stray_nest/screens/chatbox.dart';
import 'package:stray_nest/screens/introscreen.dart';
import 'package:stray_nest/screens/nav.dart';
import 'package:stray_nest/screens/rescue.dart';
import 'package:stray_nest/screens/signin.dart';
import 'package:stray_nest/screens/signup.dart';
import 'package:stray_nest/screens/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'splashscreen',
      routes: {
        'introscreen': (context) => const Intro_Screen(),
        'splashscreen': (context) => const SplashScreen(),
        'signin': (context) => SignIn(
              // onTap: () {},
            ),
        'signup': (context) => SignUp(
              // onTap: () {},
            ),
         'nav': (context) => const Nav(),  
         'chatbox': (context) => const Chatbox(),
      'lostfound': (context) => const LostFound(),
      'rescue': (context) => const Rescue(),
      },

    );
  }
}