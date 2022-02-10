import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:test2/screens/send/send.dart';
import 'package:test2/variable/variable_color.dart';

Widget features(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
    child: Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            "Features",
            style: TextStyle(
              fontSize: 17,
              color: colorBlackText,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "See more",
            style: TextStyle(
              fontSize: 12,
              color: colorBlackText,
              fontWeight: FontWeight.bold,
            ),
          )
        ]),
        const SizedBox(
          height: 10,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: [
            GestureDetector(
                onTap: () {
                  //   showBottomSheet(
                  //   context: context,
                  //   builder: (cxt) => const Send(),
                  //   backgroundColor: Colors.transparent,
                  // );
                  Get.bottomSheet(
                    const Padding(
                      padding: EdgeInsets.only(top: 100),
                      child: Send(),
                    ),
                    isScrollControlled: true,
                    barrierColor: Colors.transparent,
                    isDismissible: true,
                  );
                },
                child: buttonFeature("Send", "assets/storage/money-send.svg")),
            buttonFeature("Receive", "assets/storage/Group 7.svg"),
            buttonFeature("Rewards", "assets/storage/Group 6.svg"),
          ]),
        )
      ],
    ),
  );
}

Widget buttonFeature(String text, String urlImage) {
  return Container(
    margin: const EdgeInsets.only(right: 15),
    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
    decoration: BoxDecoration(
      color: colorGreyText.withOpacity(0.2),
      borderRadius: BorderRadius.circular(5),
    ),
    child: Row(
      children: [
        SvgPicture.asset(
          urlImage,
          width: 18,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
