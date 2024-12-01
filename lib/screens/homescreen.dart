// // import 'package:flutter/material.dart';

// // class Home_Screen extends StatefulWidget {
// //   const Home_Screen({super.key});

// //   @override
// //   State<Home_Screen> createState() => _Home_ScreenState();
// // }

// // class _Home_ScreenState extends State<Home_Screen> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: SingleChildScrollView(
// //         child: Column(
// //           children: [],
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Home',
//           style: TextStyle(color: Colors.orange),
//         ),
//         backgroundColor: Colors.white,
//         elevation: 0.5,
//         centerTitle: true,
//         iconTheme: const IconThemeData(color: Colors.orange),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Tips and Tricks Section
//             Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: Text(
//                 'Tips and Tricks',
//                 style: TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.deepPurple,
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 200,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: [
//                   buildCard('Feeding Tips', 'Tips on the best diet for animals'),
//                   buildCard(
//                       'Training Tips', 'Advice on behavioral training'),
//                   buildCard('Health Tips', 'Keeping animals healthy'),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20),

//             // Donation Section
//             Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: Text(
//                 'Donation System',
//                 style: TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.deepPurple,
//                 ),
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.all(12.0),
//               decoration: BoxDecoration(
//                 color: Colors.orange[100],
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               margin: const EdgeInsets.symmetric(horizontal: 12),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'Support Our Cause',
//                     style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.deepPurple),
//                   ),
//                   const SizedBox(height: 8),
//                   const Text(
//                     'Your contributions help us rescue, shelter, and care for animals in need.',
//                     style: TextStyle(fontSize: 14),
//                   ),
//                   const SizedBox(height: 12),
//                   ElevatedButton(
//                     onPressed: () {
//                       // Handle donation action here
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.orange,
//                     ),
//                     child: const Text('Donate Now'),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20),

//             // Helpline/Support Section
//             Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: Text(
//                 '24/7 Helpline & Support',
//                 style: TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.deepPurple,
//                 ),
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.all(12.0),
//               decoration: BoxDecoration(
//                 color: Colors.purple[100],
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               margin: const EdgeInsets.symmetric(horizontal: 12),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: const [
//                   Text(
//                     'We are here to help!',
//                     style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.deepPurple),
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     'For rescue or medical inquiries, contact us anytime through multiple channels:',
//                     style: TextStyle(fontSize: 14),
//                   ),
//                   SizedBox(height: 12),
//                   Text(
//                     '• Phone: +1 234 567 890\n• Email: support@straynest.com\n• Chat: Available in the app',
//                     style: TextStyle(fontSize: 14),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }

//   // Helper to build cards for Tips and Tricks
//   Widget buildCard(String title, String subtitle) {
//     return Container(
//       width: 160,
//       margin: const EdgeInsets.symmetric(horizontal: 8),
//       decoration: BoxDecoration(
//         color: Colors.deepPurple[100],
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               style: const TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.deepPurple,
//               ),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               subtitle,
//               style: const TextStyle(fontSize: 14),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:stray_nest/tips_data.dart';
// import 'tips_data.dart'; // Importing the tips data file

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.orange),
        ),
        backgroundColor: Colors.white,
        elevation: 0.5,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.orange),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tips and Tricks Section
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Tips and Tricks',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                  itemCount: 100, // Arbitrary large number for cycling tips
                itemBuilder: (context, index) {
                  // Calculate the index of the tip using modulus to loop back
                  int tipIndex = index % TipsData.tips.length;
                  return buildCard(
                      TipsData.tips[tipIndex]['title']!,
                      TipsData.tips[tipIndex]['subtitle']!);
                },
              ),
            ),
            const SizedBox(height: 20),

            // Donation Section
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Donation System',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.orange[100],
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Support Our Cause',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Your contributions help us rescue, shelter, and care for animals in need.',
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      // Handle donation action here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                    ),
                    child: const Text('Donate Now'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Helpline/Support Section
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                '24/7 Helpline & Support',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.purple[100],
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'We are here to help!',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'For rescue or medical inquiries, contact us anytime through multiple channels:',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 12),
                  Text(
                    '• Phone: +1 234 567 890\n• Email: support@straynest.com\n• Chat: Available in the app',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Helper to build cards for Tips and Tricks
  Widget buildCard(String title, String subtitle) {
    return Container(
      width: 160,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.deepPurple[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
