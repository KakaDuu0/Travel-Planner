import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class DestinationCard extends StatefulWidget {
  String title = '';
  double rating = 0;
  double price = 0;
  double budget = 0;
  List<String> images = [];

  DestinationCard({super.key, required data}) {
    title = data['title'];
    rating = data['rating'];
    images = data['images'];
    price = data['price'];
    budget = data['budget'];
  }

  @override
  State<StatefulWidget> createState() => DestinationCardState();
}

class DestinationCardState extends State<DestinationCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            child: Image.network(
              widget.images[0],
              height: 280,
              width: 400,
              fit: BoxFit.fitHeight,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                child: Text(
                  widget.title,
                  style: GoogleFonts.getFont(
                    "Dancing Script",
                    fontSize: 25,
                  ),
                ),
              ),
              const Expanded(
                child: SizedBox(),
              ),
              const Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              Text(widget.rating.toString()),
              if (widget.budget - 0.2 * widget.budget > widget.price)
                Text(
                  "${widget.price}\$",
                  style: const TextStyle(color: Colors.green),
                )
              else if (widget.budget + 0.2 * widget.budget < widget.price)
                Text(
                  "${widget.price}\$",
                  style: const TextStyle(color: Colors.red),
                )
              else
                Text(
                  "${widget.price}\$",
                  style: const TextStyle(color: Colors.orange),
                )
            ],
          ),
        ],
      ),
    );
  }
}
