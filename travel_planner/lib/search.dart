import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'service.dart';
import 'models/destination_card.dart';
import 'models/destination.dart';

class SearchPage extends StatefulWidget {
  final void Function(double) scrollCallback;

  const SearchPage(
      {super.key, required this.scrollCallback, required this.service});

  final Service service;

  @override
  State<StatefulWidget> createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  bool isSearching = false;

  final ScrollController _scrollController = ScrollController();

  List<bool> focusedList = [false, false, false];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      widget.scrollCallback(_scrollController.offset);
    });
  }

  Widget popularDestinations(var destinationCards, var destinations) {
    return SizedBox(
      //width: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Popular destinations',
            style: GoogleFonts.getFont(
              'Dancing Script',
              fontSize: 35,
              color: Colors.white,
            ),
          ),
          Column(
            children: List.generate(
              destinationCards.length,
              growable: true,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: focusedList[index] ? 700 : 350,
                width: focusedList[index] ? 500 : 400,
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: MaterialButton(
                  padding: const EdgeInsets.all(0),
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onPressed: () {
                    setState(() {
                      focusedList[index] = !focusedList[index];
                      //_destinationKeys[index].currentState?.setFocused();
                    });
                  },
                  child: focusedList[index]
                      ? destinations[index]
                      : destinationCards[index],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget searchResultsWidget() {
    return const SizedBox(
      height: 400,
      child: Column(
        children: [
          Text('Search Result'),
          Text('Search Result'),
          Text('Search Result'),
          Text('Search Result'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Destination> destinations = [
      Destination(
        data: const {
          'title': "Title",
          'price': 500,
          'rating': 3.6,
          'budget': 700,
          'images': [
            'https://cf.bstatic.com/xdata/images/hotel/max1024x768/465571045.jpg?k=02196325840def7cafaa7e4433e5a101dd117244001194c539ff9281d3b7b0a2&o=&hp=1'
          ]
        },
      ),
      Destination(
        data: const {
          'title': "Title",
          'price': 700,
          'rating': 3.6,
          'budget': 700,
          'images': [
            'https://cf.bstatic.com/xdata/images/hotel/max1024x768/465571045.jpg?k=02196325840def7cafaa7e4433e5a101dd117244001194c539ff9281d3b7b0a2&o=&hp=1'
          ]
        },
      ),
      Destination(
        data: const {
          'title': "Title",
          'price': 900,
          'rating': 3.6,
          'budget': 700,
          'images': [
            'https://cf.bstatic.com/xdata/images/hotel/max1024x768/465571045.jpg?k=02196325840def7cafaa7e4433e5a101dd117244001194c539ff9281d3b7b0a2&o=&hp=1'
          ]
        },
      )
    ];
    List<DestinationCard> destinationCards = [
      DestinationCard(
        data: const {
          'title': "Title",
          'price': 500,
          'rating': 3.6,
          'budget': 700,
          'images': [
            'https://cf.bstatic.com/xdata/images/hotel/max1024x768/465571045.jpg?k=02196325840def7cafaa7e4433e5a101dd117244001194c539ff9281d3b7b0a2&o=&hp=1'
          ]
        },
      ),
      DestinationCard(
        data: const {
          'title': "Title",
          'price': 700,
          'rating': 3.6,
          'budget': 700,
          'images': [
            'https://cf.bstatic.com/xdata/images/hotel/max1024x768/465571045.jpg?k=02196325840def7cafaa7e4433e5a101dd117244001194c539ff9281d3b7b0a2&o=&hp=1'
          ]
        },
      ),
      DestinationCard(
        data: const {
          'title': "Title",
          'price': 900,
          'rating': 3.6,
          'budget': 700,
          'images': [
            'https://cf.bstatic.com/xdata/images/hotel/max1024x768/465571045.jpg?k=02196325840def7cafaa7e4433e5a101dd117244001194c539ff9281d3b7b0a2&o=&hp=1'
          ]
        },
      )
    ];
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.transparent,
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: ListView(
            controller: _scrollController,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              TextFormField(
                onTap: () {
                  setState(() {
                    isSearching = true;
                  });
                },
                onChanged: (value) {
                  if (value.isEmpty) {
                    setState(() {
                      isSearching = false;
                    });
                  } else {
                    setState(() {
                      isSearching = true;
                    });
                  }
                },
                cursorColor: Colors.black,
                cursorWidth: 1,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hoverColor: Colors.white,
                  focusColor: Colors.white,
                  contentPadding: const EdgeInsets.only(left: 25, bottom: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: const BorderSide(width: 0),
                  ),
                  hintText: 'Search for destination',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isSearching = !isSearching;
                      });
                    },
                    icon: Icon(
                      isSearching ? Icons.cancel : Icons.search,
                      color: Colors.black,
                    ),
                    splashRadius: 0.1,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              if (isSearching)
                searchResultsWidget()
              else
                popularDestinations(destinationCards, destinations)
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
