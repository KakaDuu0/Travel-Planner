import 'package:flutter/material.dart';
import 'package:travel_planner/profile_page.dart';
import 'package:travel_planner/settings_page.dart';
import 'service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.service});

  final Service service;

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.transparent,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(vertical: 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.black,
                ),
                height: 400,
                margin: const EdgeInsets.symmetric(horizontal: 50),
                child: ListView(
                  children: [
                    OutlinedButton(onPressed: () {}, child: const Text('salut'))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key, required this.service});

  final Service service;

  @override
  State<StatefulWidget> createState() => MainHomePageState();
}

class MainHomePageState extends State<MainHomePage> {
  int currentIndex = 1;
  double slideValue = 0.0;

  List<String> pages = [
    'Profile',
    'Home',
    'Settings',
  ];

  void setActivePage(int index) {
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
      SettingsPage(service: widget.service),
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 1,
        leading: IconButton(
          padding: const EdgeInsets.only(left: 20, top: 10),
          onPressed: () {
            setActivePage(0);
          },
          icon: const Icon(
            Icons.person,
            color: Colors.white,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            titleItem(0),
            const SizedBox(
              width: 10,
            ),
            titleItem(1),
            const SizedBox(
              width: 10,
            ),
            titleItem(2),
          ],
        ),
        actions: [
          IconButton(
            padding: const EdgeInsets.only(right: 20, top: 10),
            onPressed: () {
              setActivePage(2);
            },
            icon: const Icon(
              Icons.settings,
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
          child: CustomScrollView(
            slivers: [
              SliverList.list(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: List.generate(
                        slides.length,
                        (index) {
                          final slidePosition = index - currentIndex;
                          final slideFraction =
                              slideValue / MediaQuery.of(context).size.width;

                          final slideTransform = Matrix4.identity()
                            ..translate(slideFraction *
                                MediaQuery.of(context).size.width);

                          return AnimatedPositioned(
                            duration: const Duration(milliseconds: 250),
                            curve: Curves.easeInOut,
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            left: slidePosition *
                                MediaQuery.of(context).size.width,
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
