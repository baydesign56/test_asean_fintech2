import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:test2/variable/variable_color.dart';

Widget cardBlue() {
  return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(10),
      width: Get.width,
      decoration: BoxDecoration(
        color: colorCardBlue,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textCardBlue("Ebl titanium account"),
              textCardBlue("Arian zesan"),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Rp. 6,190.0",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            "Total balance",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textCardBlue("Added card:05"),
              textCardBlue("Ac. no. 2234521"),
            ],
          ),
        ],
      ));
}

Widget textCardBlue(String text) {
  return Text(
    text,
    style: TextStyle(color: colorWhitePrimary.withOpacity(0.6)),
  );
}
