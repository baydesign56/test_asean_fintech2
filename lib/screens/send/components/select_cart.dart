import 'package:flutter/material.dart';
import 'package:test2/variable/variable_color.dart';

class SelectCart extends StatefulWidget {
  const SelectCart({Key? key}) : super(key: key);

  @override
  _SelectCartState createState() => _SelectCartState();
}

class _SelectCartState extends State<SelectCart> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Text(
            "Select card",
            style: TextStyle(
              fontSize: 17,
              color: colorBlackText,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const SizedBox(width: 15),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 0;
                  });
                },
                child: buttonSelectCart("assets/storage/Group 41.png",
                    "Physical ebl card", 20, index, 0),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 1;
                  });
                },
                child: buttonSelectCart("assets/storage/visa-logo.png",
                    "Virtual ebl card", 10, index, 1),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 2;
                  });
                },
                child: buttonSelectCart(
                    "assets/storage/amex.png", "Ebl debit card", 10, index, 2),
              )
            ],
          ),
        )
      ],
    );
  }
}

Widget buttonSelectCart(
    String imageUrl, String text, double height, int index, int number) {
  return Container(
    padding: const EdgeInsets.all(8),
    height: 40,
    decoration: BoxDecoration(
      color: index == number ? colorBluePrimary : const Color(0xFFE5E7E7),
      borderRadius: BorderRadius.circular(5),
    ),
    margin: const EdgeInsets.only(right: 15),
    child: Row(
      children: [
        SizedBox(
          height: height,
          child: Image.asset(
            imageUrl,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 12,
            color:
                index == number ? colorWhitePrimary : const Color(0xFF000C14),
          ),
        )
      ],
    ),
  );
}
