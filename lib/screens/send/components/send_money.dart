import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:test2/variable/variable_color.dart';

class SendMoney extends StatefulWidget {
  const SendMoney({Key? key}) : super(key: key);

  @override
  _SendMoneyState createState() => _SendMoneyState();
}

class _SendMoneyState extends State<SendMoney> {
  bool a = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  a ? a = false : a = true;
                });
              },
              icon: SvgPicture.asset(a
                  ? "assets/storage/Group 87.svg"
                  : "assets/storage/Group 871.svg"),
            ),
            const Text("Agree with ideate’s terms and conditions",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ))
          ],
        ),
        GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            margin: const EdgeInsets.fromLTRB(15, 0, 15, 15),
            width: Get.width,
            decoration: BoxDecoration(
              color: colorBlueButton,
              borderRadius: BorderRadius.circular(5),
            ),
            padding: const EdgeInsets.all(20),
            child: Center(
                child: Text(
              "Send money",
              style: TextStyle(
                color: colorWhitePrimary,
                fontSize: 18,
              ),
            )),
          ),
        )
      ],
    );
  }
}
