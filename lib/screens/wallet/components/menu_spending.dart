import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:test2/variable/variable_color.dart';

class MenuSPending extends StatefulWidget {
  const MenuSPending({Key? key}) : super(key: key);

  @override
  _MenuSPendingState createState() => _MenuSPendingState();
}

class _MenuSPendingState extends State<MenuSPending> {
  List<String> a = ["Day", "Week", "Month", "Custom range"];

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 5),
      margin: const EdgeInsets.fromLTRB(15, 0, 15, 10),
      width: Get.width,
      decoration: BoxDecoration(
        color: const Color(0xFFF2F3F3),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (var i = 0; i < a.length; i++)
            GestureDetector(
                onTap: () {
                  setState(() {
                    index = i;
                  });
                },
                child: buttonMenuSpendig(index, i, a[i])),
        ],
      ),
    );
  }
}

Widget buttonMenuSpendig(
  int index,
  int i,
  String title,
) {
  return Padding(
    padding: const EdgeInsets.only(right: 0),
    child: Column(children: [
      Text(
        title,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: index == i ? colorBlackText : colorGreyText,
        ),
      ),
      const SizedBox(
        height: 2,
      ),
      Container(
        width: 7,
        height: 7,
        decoration: BoxDecoration(
          color: index == i ? colorBluePrimary : Colors.transparent,
          shape: BoxShape.circle,
        ),
      )
    ]),
  );
}
