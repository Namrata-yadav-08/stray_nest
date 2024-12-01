import 'package:flutter/material.dart';
import 'package:stray_nest/screens/LostFound.dart';
import 'package:stray_nest/screens/community.dart';
import 'package:stray_nest/screens/chatbox.dart';
import 'package:stray_nest/screens/homescreen.dart';
import 'package:stray_nest/screens/profile.dart';
import 'package:stray_nest/screens/rescue.dart';

class Nav extends StatefulWidget {
  const Nav({super.key});

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _index = 0;
  final screens = [const HomeScreen(), const LostFound(),Rescue(), comm(), const Profile()];
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: screens[_index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: textTheme.bodySmall,
        unselectedLabelStyle: textTheme.bodySmall,
        elevation: 30,
        backgroundColor: Colors.white,
        selectedItemColor: Color.fromARGB(255, 246, 146, 70),
        unselectedItemColor: Color.fromARGB(255, 91, 90, 90),
        currentIndex: _index,
        onTap: (int newIndex) {
          setState(() {
            _index = newIndex;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            label: 'Lost & Found',
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_pin),
            label: 'Rescue',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.contact_support),
        onPressed:(){ Navigator.pushNamed(context,'chatbox');}),
    );
  }
}
