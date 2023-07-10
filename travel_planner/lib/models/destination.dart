import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class Destination extends Container {
  String title = '';
  double rating = 0;
  double price = 0;
  double budget = 0;
  List<String> images = [];

  Destination({super.key, required data})
      : super(
          height: 350, width: 400, margin: const EdgeInsets.all(20),
          //padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        ) {
    title = data['title'];
    rating = data['rating'];
    images = data['images'];
    price = data['price'];
    budget = data['budget'];
  }

  @override
  Decoration? get decoration => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      );

  @override
  Widget? get child => MaterialButton(
        padding: const EdgeInsets.all(0),
        onPressed: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25)),
              child: Image.network(
                images[0],
                height: 280,
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
                    title,
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
                Text(rating.toString()),
                if (budget - 0.2 * budget > price)
                  Text(
                    "$price\$",
                    style: const TextStyle(color: Colors.green),
                  )
                else if (budget + 0.2 * budget < price)
                  Text(
                    "$price\$",
                    style: const TextStyle(color: Colors.red),
                  )
                else
                  Text(
                    "$price\$",
                    style: const TextStyle(color: Colors.orange),
                  )
              ],
            ),
          ],
        ),
      );
}
