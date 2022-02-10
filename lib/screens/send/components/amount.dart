import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:test2/variable/variable_color.dart';

Widget amount() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Text(
          "Amount",
          style: TextStyle(
            fontSize: 17,
            color: colorBlackText,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      const SizedBox(height: 15),
      Container(
        margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        padding: const EdgeInsets.fromLTRB(25, 15, 25, 15),
        width: Get.width,
        decoration: BoxDecoration(
          color: colorWhitePrimary,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(children: [
          const Text(
            "Rp.75.00",
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          listAmount(),
        ]),
      )
    ],
  );
}

Widget listAmount() {
  return SvgPicture.asset("assets/storage/Group 85.svg");
}
