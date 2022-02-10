import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:test2/controller/controller_auth.dart';
import 'package:test2/variable/variable_color.dart';

Widget topBar() {
  Random rnd = Random();
  int im = 1 + rnd.nextInt(5 - 1);
  return GetBuilder<ControllerAuth>(builder: (v) {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.all(15),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            SizedBox(
              width: 40,
              height: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset("assets/storage/avatar/frame$im.png"),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            SizedBox(
              width: Get.width / 3,
              child: Text(
              
                v.name == null ? "Good day, User" : "Good day,${v.name}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        buttonRicleBlue("assets/storage/Group 47.png"),
      ]),
    );
  });
}

Widget buttonRicleBlue(String imageAssets) {
  return Container(
    width: 40,
    height: 40,
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: colorBluePrimary.withOpacity(0.2),
      shape: BoxShape.circle,
    ),
    child: Image.asset(
      imageAssets,
    ),
  );
}
