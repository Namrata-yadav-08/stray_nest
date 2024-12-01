
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'user_controller.dart';


class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  User? user;
  TextEditingController _displayNameController = TextEditingController();
  String? globalUserImage;
  @override
  void initState() {
    super.initState();
    // Fetch the currently logged-in user
    getUser();
  }

  Future<void> getUser() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      setState(() {
        user = currentUser;
        _displayNameController.text = currentUser.displayName ?? '';
      });
      // You can access user.email, user.displayName, user.photoURL, etc.
    }
  }

  Future<void> _showChangePasswordDialog() async {
    String newPassword = '';
    bool passwordConfirmed = false;
    return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: Text('Change Password'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(hintText: 'Enter new password'),
                    onChanged: (value) {
                      setState(() {
                        newPassword = value;
                      });
                    },
                  ),
                  TextField(
                    obscureText: true,
                    decoration:
                        InputDecoration(hintText: 'Confirm new password'),
                    onChanged: (value) {
                      setState(() {
                        passwordConfirmed = value == newPassword;
                      });
                    },
                  ),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('CANCEL'),
                ),
                TextButton(
                  onPressed: () async {
                    if (newPassword.isNotEmpty && passwordConfirmed) {
                      try {
                        await user?.updatePassword(newPassword);
                      } catch (e) {
                        print('Password update failed: $e');
                      }
                    } else {
                      print('Password do not match or are empty');
                    }
                    Navigator.of(context).pop();
                  },
                  child: Text("SAVE"),
                )
              ],
            );
          },
        );
      },
    );
  }

  void _showChangeProfilePictureDialog() async {
    final picker = ImagePicker();
    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        globalUserImage = pickedImage.path;
      });
      await user?.updatePhotoURL(pickedImage.path);
      await user?.reload();
      await getUser();
      userController.setUserImage(pickedImage.path);
      // Navigator.pop(context, pickedImage.path);
    }
  }

  Future<void> _showChangeNameDialog() async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Change Name'),
            content: TextField(
              controller: _displayNameController,
              decoration: InputDecoration(hintText: 'Enter new name'),
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('CANCEL')),
              TextButton(
                  onPressed: () async {
                    String newName = _displayNameController.text.trim();
                    if (newName.isNotEmpty) {
                      await user?.updateDisplayName(newName);
                      await user?.reload();
                      await getUser();
                    }
                    Navigator.of(context).pop();
                  },
                  child: Text("SAVE"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromARGB(255, 244, 244, 244),
      appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 77,
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 244, 244, 244),
          title: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Text(
                "Profile",
                style: GoogleFonts.inter(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w700),
              ),
            ),
          )),
      body: Expanded(
          child: SingleChildScrollView(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Column(
                children: [
                  // Text(
                  //   'Profile',
                  //   style: TextStyle(
                  //       fontSize: 24, fontWeight: FontWeight.bold),
                  // ),
                  Padding(padding: EdgeInsets.only(top: 82)),
                  Center(
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: globalUserImage != null &&
                              globalUserImage!.isNotEmpty
                          ? FileImage(File(
                              globalUserImage!)) // User's image if available
                          : AssetImage('assets/images/Group 171 (2).png')
                              as ImageProvider<Object>,
                    ),
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  Center(
                      child: Text(user?.displayName ?? 'User',
                          style: GoogleFonts.inter(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Colors.black))),
                ],
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.all(10)),
          Row(
            children: [
              Container(
                height: 30,
                color: Colors.white,
              ),
              Container(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Text(
              'Settings',
              textAlign: TextAlign.start,
              style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(178, 0, 0, 0)),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color.fromARGB(255, 252, 252, 254),
              ),
              width: _width * 0.90,
              height: 48,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.access_time,
                      size: 20,
                      color:Color.fromARGB(255, 246, 146, 70),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Reminders",
                      style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios_rounded,
                        )),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color.fromARGB(255, 252, 252, 254),
              ),
              width: _width * 0.90,
              height: 48,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.notifications,
                      size: 20,
                      color:Color.fromARGB(255, 246, 146, 70),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Notification",
                      style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    // Padding(
                    //   padding: EdgeInsets.only(left: _width * 0.32),
                    //   child:
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios_rounded,
                        )),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Text(
              'Account',
              textAlign: TextAlign.start,
              style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(178, 0, 0, 0)),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color.fromARGB(255, 252, 252, 254),
              ),
              width: _width * 0.90,
              height: 48,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.verified_user,
                      size: 20,
                      color:Color.fromARGB(255, 246, 146, 70),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Change Name",
                      style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    IconButton(
                        onPressed: () {
                          _showChangeNameDialog();
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios_rounded,
                        )),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color.fromARGB(255, 252, 252, 254),
              ),
              width: _width * 0.90,
              height: 48,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.key,
                      size: 20,
                      color:Color.fromARGB(255, 246, 146, 70),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Change Password",
                      style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    // Padding(
                    //   padding: EdgeInsets.only(left: _width * 0.32),
                    //   child:
                    IconButton(
                        onPressed: () async {
                          await _showChangePasswordDialog();
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios_rounded,
                        )),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color.fromARGB(255, 252, 252, 254),
              ),
              width: _width * 0.90,
              height: 48,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.person_rounded,
                      size: 20,
                      color:Color.fromARGB(255, 246, 146, 70),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Change Profile Picture",
                      style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    IconButton(
                        onPressed: () async {
                          _showChangeProfilePictureDialog();
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios_rounded,
                        )),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Text(
              'Up ToDo',
              textAlign: TextAlign.start,
              style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(178, 0, 0, 0)),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color.fromARGB(255, 252, 252, 254),
              ),
              width: _width * 0.90,
              height: 48,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.info_outline_rounded,
                      size: 20,
                      color:Color.fromARGB(255, 246, 146, 70),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "About Us",
                      style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'about_us');
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios_rounded,
                        )),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color.fromARGB(255, 252, 252, 254),
              ),
              width: _width * 0.90,
              height: 48,
              // decoration: BoxDecoration(
              //     color: const Color.fromARGB(255, 252, 252, 254),
              //     borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    const Icon(
                      Icons.logout,
                      size: 20,
                      color:Color.fromARGB(255, 246, 146, 70),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    TextButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signOut();
                      },
                      child: Text(
                        "LOGOUT",
                        style: GoogleFonts.inter(
                            color: Color.fromARGB(255, 246, 146, 70),
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color.fromARGB(255, 252, 252, 254),
              ),
              width: _width * 0.90,
              height: 48,
              // decoration: BoxDecoration(
              //     color: const Color.fromARGB(255, 252, 252, 254),
              //     borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    const Icon(
                      Icons.delete,
                      size: 20,
                      color:Color.fromARGB(255, 246, 146, 70),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    TextButton(
                      onPressed: () async {
                        await user?.delete();
                      },
                      child: Text(
                        "Delete account",
                        style: GoogleFonts.inter(
                            color: Color.fromARGB(255, 246, 146, 70),
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ))),
    ));
  }
}
