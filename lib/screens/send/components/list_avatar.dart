import 'package:flutter/material.dart';

Widget listAvatar() {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        const SizedBox(
          width: 15,
        ),
        for (var i = 1; i <= 5; i++)
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: SizedBox(
              width: 45,
              height: 45,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset("assets/storage/avatar/frame$i.png"),
              ),
            ),
          ),
      ],
    ),
  );
}
