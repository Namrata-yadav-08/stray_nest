import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:math';
import 'package:geolocator/geolocator.dart';
class Rescue extends StatefulWidget {
  const Rescue({super.key});

  @override
  State<Rescue> createState() => _RescueState();
}

class _RescueState extends State<Rescue> {
  File? _selectedImage;
  TextEditingController _locationController = TextEditingController();
  String? _currentLocation;
  // Function to pick an image
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }
   Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Location services are disabled.')),
      );
      return;
    }

    // Check for location permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Location permissions are denied.')),
        );
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are permanently denied
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Location permissions are permanently denied.')),
      );
      return;
    }

    // Retrieve current location
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    setState(() {
      _currentLocation =
          "${position.latitude}, ${position.longitude}"; // Set current location
      _locationController.text = _currentLocation!;
    });
  }

  // Function to handle location send
  void _sendLocation() {
    if (_locationController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter or retrieve a location.')),
      );
      return;
    }

    // Simulate sending location
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Location sent: ${_locationController.text}')),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Center(
          child: Text(
            "Animal rescue",
            style: GoogleFonts.bodoniModa(
              textStyle: TextStyle(
                color: Colors.black,
                fontSize: 32,
                fontWeight: FontWeight.w400,
                shadows: [
                  Shadow(
                    color: Color.fromARGB(255, 141, 141, 141),
                    offset: Offset(0, 2),
                    blurRadius: 10,
                  )
                ],
              ),
            ),
          ),
        ),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
        ],
      ),
      body: Stack(
        children: [
          // Background Image
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/iPhone 14 Pro - 3.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Dashed Circular Avatar
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Dashed Border with Shadow
                    CustomPaint(
                      size: Size(292, 292), // 2 * radius of the CircleAvatar
                      painter: DashedCirclePainter(
                        color: Colors.black, // 20% transparency
                        strokeWidth:1.5,
                        dashLength: 10.5,
                      ),
                    ),
                    // Circle Shadow
                    Container(
                      width: 292,
                      height: 292,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            blurRadius: 30,
                            spreadRadius: 2,
                            offset: Offset(0, 3)
                          ),
                        ],
                        color: Colors.white.withOpacity(0.2), 
                      ),
                    ),
                    // Content Inside Circle
                    CircleAvatar(
                      radius: 146,
                      backgroundColor: Colors.white.withOpacity(0.2),
                      backgroundImage:
                          _selectedImage != null ? FileImage(_selectedImage!) : null,
                      child: _selectedImage == null
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(icon: Icon(Icons.cloud_upload_outlined, size: 90, color: const Color.fromARGB(255, 249, 249, 249)), onPressed: _pickImage
                                  
                                ,),
                                SizedBox(height: 27),
                                Text(
                                  "Upload Image",
                                  style: GoogleFonts.imprima(
                                    textStyle: TextStyle(
                                      color: const Color.fromARGB(255, 249, 249, 249),
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : null,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40), // Space between avatar and location input

              // Location Input Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on, size: 30, color: Colors.redAccent),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: _locationController,
                      decoration: InputDecoration(
                        hintText: 'Enter or get your location',
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: _getCurrentLocation,
                    icon: Icon(Icons.my_location, color: Colors.blue),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Send Button
              ElevatedButton.icon(
                onPressed: _sendLocation,
                icon: Icon(Icons.send, color: Colors.white),
                label: Text(
                  'Send',
                  style: TextStyle(fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                  padding: EdgeInsets.symmetric(vertical: 14, horizontal: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            
              
              
            ],
          ),
        ],
      ),
    );
  }
}

// Dashed Circle Painter
class DashedCirclePainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dashLength;

  DashedCirclePainter({
    required this.color,
    required this.strokeWidth,
    required this.dashLength,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    double radius = size.width / 2;
    double circumference = 2 * pi * radius;

    // Calculate the number of dashes
    double dashCount = circumference / (dashLength * 2);

    for (int i = 0; i < dashCount; i++) {
      double startAngle = i * (dashLength * 2) / radius;
      double sweepAngle = dashLength / radius;
      canvas.drawArc(
        Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: radius),
        startAngle,
        sweepAngle,
        false,
        paint,
      );
    }
  }
  

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
