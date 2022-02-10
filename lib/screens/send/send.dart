import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:test2/variable/variable_color.dart';

import 'components/amount.dart';
import 'components/list_avatar.dart';
import 'components/select_cart.dart';
import 'components/send_money.dart';

class Send extends StatefulWidget {
  const Send({Key? key}) : super(key: key);

  @override
  _SendState createState() => _SendState();
}

class _SendState extends State<Send> {
  FocusNode fText = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          fText.unfocus();
        });
      },
      child: Container(
        height: Get.height,
        color: colorGreyPrimary,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 15),
                child: Center(
                  child: Container(
                    width: 100,
                    height: 5,
                    decoration: BoxDecoration(
                      color: const Color(0xFF666D72),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  "Send money",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: colorBlackText,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const SelectCart(),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Text(
                  "Choose recipient",
                  style: TextStyle(
                    fontSize: 17,
                    color: colorBlackText,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                decoration: BoxDecoration(
                  color: colorWhitePrimary,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextField(
                  focusNode: fText,
                  style: const TextStyle(
                    fontSize: 13,
                  ),
                  decoration: InputDecoration(
                    hintText: "Type name/card/phone number/email",
                    border: InputBorder.none,
                    suffixIconConstraints: const BoxConstraints(
                      maxHeight: 25,
                      minWidth: 25,
                    ),
                    suffixIcon:
                        SvgPicture.asset("assets/storage/Security Safe.svg"),
                  ),
                ),
              ),
              listAvatar(),
              const SizedBox(height: 20),
              amount(),
              const SizedBox(height: 40),
              const SendMoney(),
            ],
          ),
        ),
      ),
    );
  }
}
