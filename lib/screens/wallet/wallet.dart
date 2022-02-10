import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:test2/models/model_card_wallets.dart';
import 'package:test2/screens/home/components/top_bar.dart';
import 'package:test2/variable/variable_color.dart';

import 'components/amount_wallets.dart';
import 'components/card_wallets.dart';
import 'components/chart_custom.dart';
import 'components/menu_spending.dart';

class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorWhitePrimary,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 40,
                        height: 0,
                      ),
                      const Text(
                        "Wallets",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      buttonRicleBlue("assets/storage/Add.png"),
                    ],
                  ),
                ),
                CardWallets(
                  listBank: [
                    ModelCardWallets(
                      imageUrlIcon: "assets/storage/Group 41.png",
                      nameBank: "Physical ebl card",
                      amount: "2,960.00",
                    ),
                    ModelCardWallets(
                      imageUrlIcon: "assets/storage/visa-logo.png",
                      nameBank: "Virtual ebl card",
                      amount: "6,960.00",
                    ),
                    ModelCardWallets(
                      imageUrlIcon: "assets/storage/amex.png",
                      nameBank: "Ebl debit card",
                      amount: "1,360.00",
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    "Total spending",
                    style: TextStyle(
                      fontSize: 17,
                      color: colorBlackText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const MenuSPending(),
                const ChartCustom(),
                const SizedBox(
                  height: 30,
                ),
                amountWallets(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      square("Weekly income", "Rp. 2,960.00"),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF2F3F3),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          "See details",
                          style: TextStyle(
                            color: colorBlackText,
                            fontSize: 12,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ));
  }
}
