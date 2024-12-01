import 'package:flutter/material.dart';

Widget createCard({
  required String imagePath,
  required String title,
  required String authorName,
  required String date,
}) {
  return Container(
    margin: const EdgeInsets.all(15),
    height: 252,
    width: 300,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 5,
          offset: Offset(0, 2),
        ),
      ],
    ),
    child: Column(
      children: [
        Container(
          child: Image.asset(imagePath),
        ),
        Column(
          children: [
            Padding(padding: EdgeInsets.all(3)),
            Container(
              margin: const EdgeInsets.all(3),
              child: Text(title),
            ),
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/Ellipse 3.1.png'),
                ),
                Column(
                  children: [
                    Text(authorName),
                    Text(
                      date,
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
                Spacer(),
                Image(image: AssetImage('assets/images/leaf.png'))
              ],
            )
          ],
        )
      ],
    ),
  );
}
