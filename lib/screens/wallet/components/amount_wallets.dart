import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:test2/variable/variable_color.dart';

Widget amountWallets() {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        const SizedBox(width: 15),
        square("Weekly spend", "Rp. 4,954.00"),
        square("Shopping", "Rp. 1,654.00"),
        square("Others", "Rp. 9,424.00"),
      ],
    ),
  );
}

Widget square(String title, String amount) {
  return Container(
    margin: const EdgeInsets.only(right: 15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: colorBlackText,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          amount,
          style: TextStyle(
            color: colorBlackText,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
