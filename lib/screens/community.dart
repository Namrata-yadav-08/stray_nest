import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stray_nest/widgets/Newsfeed.dart';

class comm extends StatefulWidget {
  const comm({Key? key}) : super(key: key);

  @override
  State<comm> createState() => _commState();
}

class _commState extends State<comm> {
  /// List of Tab Bar Item
  List<String> items = [
    "Article",
    "Donation",
    "Events",
    "Others",
  ];

  /// List of body icon
  List<Column> cards = [
    // Coustomcol(),
    Column(
      children: [
        createCard(
          imagePath: 'assets/images/Rectangle 2.18.png',
          title: 'David Aukltin, who breathed life into the Rose is dead at 92',
          authorName: 'Vidhi kkkGupta',
          date: '2024 . 01 . 01',
        ),
        createCard(
          imagePath: 'assets/images/Rectangle 2.2.png',
          title: 'David Austin, who breathed life into the Rose is dead at 92',
          authorName: 'Vidhi Gupta',
          date: '2024 . 01 . 01',
        ),
        createCard(
          imagePath: 'assets/images/Rectangle 2.2.png',
          title: 'David Austin, who breathed life into the Rose is dead at 92',
          authorName: 'Vidhi Gupta',
          date: '2024 . 01 . 01',
        ),
      ],
    ),
    Column(
      children: [
        createCard(
          imagePath: 'assets/images/Rectangle 2.2.png',
          title: 'David Austin, who breathed life into the Rose is dead at 92',
          authorName: 'Vidhi Gupta',
          date: '2024 . 01 . 01',
        ),
      ],
    ),
    Column(
      children: [
        createCard(
          imagePath: 'assets/images/Rectangle 2.18.png',
          title: 'David Austin, who breathed life into the Rose is dead at 92',
          authorName: 'Vidhi Gupta',
          date: '2024 . 01 . 01',
        ),
      ],
    ),
    Column(
      children: [
        createCard(
          imagePath: 'assets/images/Rectangle 2.18.png',
          title: 'David Austin, who breathed life into the Rose is dead at 92',
          authorName: 'Vidhi Gupta',
          date: '2024 . 01 . 01',
        ),
      ],
    ),
    Column(
      children: [
        createCard(
          imagePath: 'assets/images/Rectangle 2.18.png',
          title: 'David Austin, who breathed life into the Rose is dead at 92',
          authorName: 'Vidhi Gupta',
          date: '2024 . 01 . 01',
        ),
      ],
    ),
    // createCard(
    //   imagePath: 'assets/images/Rectangle 2.18.png',
    //   title: 'David Austin, who breathed life into the Rose is dead at 92',
    //   authorName: 'Vidhi Gupta',
    //   date: '2024 . 01 . 01',
    // ),
    // createCard(
    //   imagePath: 'assets/images/Rectangle 2.18.png',
    //   title: 'David Austin, who breathed life into the Rose is dead at 92',
    //   authorName: 'Vidhi Gupta',
    //   date: '2024 . 01 . 01',
    // ),
    // createCard(
    //   imagePath: 'assets/images/Rectangle 2.18.png',
    //   title: 'David Austin, who breathed life into the Rose is dead at 92',
    //   authorName: 'Vidhi Gupta',
    //   date: '2024 . 01 . 01',
    // ),
    // createCard(
    //   imagePath: 'assets/images/Rectangle 2.18.png',
    //   title: 'David Austin, who breathed life into the Rose is dead at 92',
    //   authorName: 'Vidhi Gupta',
    //   date: '2024 . 01 . 01',
    // )
  ];
  int current = 0;
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text(
          "Green community",
          style: GoogleFonts.poppins(
            color: const Color.fromRGBO(91, 90, 90, 1),
            fontSize: 30,
            // fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(235, 253, 242, 1),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          // height: double.infinity,
          margin: const EdgeInsets.all(5),
          child: Column(
            children: [
              /// Tab Bar
              SizedBox(
                width: double.infinity,
                height: 80,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: items.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, index) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                current = index;
                              });
                              pageController.animateToPage(
                                current,
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.ease,
                              );
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: const EdgeInsets.all(5),
                              width: 100,
                              height: 55,
                              decoration: BoxDecoration(
                                color: current == index
                                    ? Color.fromRGBO(17, 136, 68, 1)
                                    : Color.fromRGBO(235, 253, 242, 1),
                                borderRadius: current == index
                                    ? BorderRadius.circular(12)
                                    : BorderRadius.circular(7),
                                border: current == index
                                    ? Border.all(
                                        color: Color.fromRGBO(3, 134, 68, 1),
                                        width: 2.5)
                                    : null,
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      items[index],
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        color: current == index
                                            ? Colors.white
                                            : Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: current == index,
                            child: Container(
                              width: 5,
                              height: 5,
                              decoration: const BoxDecoration(
                                  color: Color.fromRGBO(17, 136, 68, 1),
                                  shape: BoxShape.circle),
                            ),
                          )
                        ],
                      );
                    }),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  // margin: const EdgeInsets.only(top: 30),
                  width: double.infinity,
                  height: 900,
                  child: PageView.builder(
                    itemCount: cards.length,
                    controller: pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return cards[current];
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your desired action when the button is pressed
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Color.fromRGBO(17, 136, 68, 1),
        shape: CircleBorder(),
        elevation: 2.0, // Set the button background color
      ),
      floatingActionButtonLocation: _CustomFloatingActionButtonLocation(),
    );
  }
}

class _CustomFloatingActionButtonLocation extends FloatingActionButtonLocation {
  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    // Adjust the vertical offset to position the button slightly above its default position
    return const Offset(340, 740);
  }

  @override
  String toString() => 'FloatingActionButtonLocation.custom';
}
