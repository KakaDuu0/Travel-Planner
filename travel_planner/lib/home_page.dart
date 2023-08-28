import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:travel_planner/profile.dart';
import 'package:travel_planner/home.dart';
import 'package:travel_planner/search.dart';
import 'service.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key, required this.service});

  final Service service;

  @override
  State<StatefulWidget> createState() => MainHomePageState();
}

class MainHomePageState extends State<MainHomePage> {
  int currentIndex = 1;
  double slideValue = 0.0;
  final int profileIndex = 0;
  final int homeIndex = 1;
  final int searchIndex = 2;
  bool isContentUnderAppbar = false;

  List<String> pages = [
    'Profile',
    'Home',
    'Search',
  ];

  void updateScrollOffset(double offset) {
    setState(() {
      isContentUnderAppbar = offset > kToolbarHeight;
    });
  }

  void setActivePage(int index) {
    if (index < 0 || index > 2) return;
    setState(() {
      currentIndex = index;
      slideValue = 0;
    });
  }

  Widget titleItem(int criticalIndex) {
    return AnimatedScale(
      duration: const Duration(milliseconds: 350),
      scale: currentIndex == criticalIndex ? 1 : 0.8,
      alignment: Alignment.bottomCenter,
      child: Text(
        pages[criticalIndex],
        style: TextStyle(
          color: Color.fromARGB(
              currentIndex == criticalIndex ? 255 : 50, 255, 255, 255),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> slides = [
      ProfilePage(service: widget.service),
      HomePage(service: widget.service),
      SearchPage(scrollCallback: updateScrollOffset, service: widget.service),
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        scrolledUnderElevation: 1,
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
                sigmaX: isContentUnderAppbar ? 10 : 0,
                sigmaY: isContentUnderAppbar ? 10 : 0),
            child: Container(
              decoration: const BoxDecoration(),
            ),
          ),
        ),
        leading: IconButton(
          splashRadius: 0.1,
          padding: const EdgeInsets.only(left: 20, top: 10),
          onPressed: () {
            setActivePage(currentIndex - 1);
          },
          icon: Icon(
            currentIndex <= homeIndex ? Icons.person : Icons.home,
            color: Colors.white,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            titleItem(profileIndex),
            const SizedBox(
              width: 10,
            ),
            titleItem(homeIndex),
            const SizedBox(
              width: 10,
            ),
            titleItem(searchIndex),
          ],
        ),
        actions: [
          IconButton(
            splashRadius: 0.1,
            padding: const EdgeInsets.only(right: 20, top: 10),
            onPressed: () {
              setActivePage(currentIndex + 1);
            },
            icon: Icon(
              currentIndex >= homeIndex ? Icons.search : Icons.home,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: GestureDetector(
          onHorizontalDragUpdate: (details) {
            slideValue += details.delta.dx;
          },
          onHorizontalDragEnd: (details) {
            if (slideValue < 50 && slideValue > -50) {
              setActivePage(currentIndex);
            }
            if (slideValue < 0 && currentIndex < slides.length - 1) {
              setActivePage(currentIndex + 1);
            } else if (slideValue > 0 && currentIndex > 0) {
              setActivePage(currentIndex - 1);
            } else {
              setActivePage(currentIndex);
            }
          },
          child: Stack(
            children: List.generate(
              slides.length,
              (index) {
                final slidePosition = index - currentIndex;

                final slideTransform = Matrix4.identity()
                  ..translate(slideValue);

                return AnimatedPositioned(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  left: slidePosition * MediaQuery.of(context).size.width,
                  child: Transform(
                    transform: slideTransform,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: slides[index],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
