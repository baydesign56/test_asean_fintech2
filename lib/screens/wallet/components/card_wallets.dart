import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:test2/models/model_card_wallets.dart';
import 'package:test2/variable/variable_color.dart';

class CardWallets extends StatefulWidget {
  const CardWallets({Key? key, this.listBank}) : super(key: key);
  final List<ModelCardWallets>? listBank;

  @override
  _CardWalletsState createState() => _CardWalletsState();
}

class _CardWalletsState extends State<CardWallets> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 15,
            ),
            for (var i = 0; i < widget.listBank!.length; i++)
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = i;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 15),
                  width: Get.width / 2,
                  // height: 300,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color:
                        index == i ? colorBluePrimary : const Color(0xFFF2F3F3),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 25,
                            child:
                                Image.asset(widget.listBank![i].imageUrlIcon!),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            child: Text(
                              widget.listBank![i].nameBank ?? "-",
                              style: TextStyle(
                                fontSize: 13,
                                color:
                                    index == i ? Colors.white : colorGreyText,
                                overflow: TextOverflow.clip,
                              ),
                              maxLines: 1,
                            ),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(
                                color: index == i
                                    ? colorWhitePrimary
                                    : colorGreyText,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.more_horiz_rounded,
                              size: 15,
                              color: index == i
                                  ? colorWhitePrimary
                                  : colorGreyText,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: Get.width / 2,
                        height: 1,
                        color: index == i ? colorWhitePrimary : colorGreyText,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                                child: Container(
                                    padding: const EdgeInsets.only(right: 5),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            right: BorderSide(
                                      color: index == i
                                          ? colorWhitePrimary
                                          : colorGreyText,
                                    ))),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Number",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: index == i
                                                ? colorWhitePrimary
                                                : colorGreyText,
                                          ),
                                        ),
                                        Text(
                                          "**** 2437 **** 2424",
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: index == i
                                                ? colorWhitePrimary
                                                : colorGreyText,
                                          ),
                                        ),
                                      ],
                                    ))),
                            Flexible(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Exp",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: index == i
                                        ? colorWhitePrimary
                                        : colorGreyText,
                                  ),
                                ),
                                Text(
                                  "12/29",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: index == i
                                        ? colorWhitePrimary
                                        : colorGreyText,
                                  ),
                                ),
                              ],
                            )),
                          ]),
                      Container(
                        width: Get.width / 2,
                        height: 1,
                        color: index == i ? colorWhitePrimary : colorGreyText,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Current balance",
                        style: TextStyle(
                          fontSize: 13,
                          color: index == i ? colorWhitePrimary : colorGreyText,
                        ),
                      ),
                      Text(
                        "Rp." + widget.listBank![i].amount!,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: index == i ? colorWhitePrimary : colorGreyText,
                        ),
                      ),
                    ],
                  ),
                ),
              )
          ]),
    );
  }
}
