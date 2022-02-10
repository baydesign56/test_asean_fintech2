import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test2/controller/controller_product.dart';
import 'package:test2/models/model_icon_bottom.dart';
import 'package:test2/screens/gift/gift.dart';
import 'package:test2/screens/home/home.dart';
import 'package:test2/screens/profile/profile.dart';
import 'package:test2/screens/wallet/wallet.dart';
import 'package:test2/variable/variable_color.dart';

import 'components/bottom_nav_custom.dart';

class WrapperMenu extends StatefulWidget {
  const WrapperMenu({Key? key}) : super(key: key);
  static String namePage = "/home";

  @override
  _WrapperMenuState createState() => _WrapperMenuState();
}

class _WrapperMenuState extends State<WrapperMenu> {
  ControllerProduct product = Get.put(ControllerProduct());

  @override
  void initState() {
    super.initState();
    product.getProduct();
  }

  PageController controller = PageController(initialPage: 0, keepPage: true);
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhitePrimary,
      body: PageView(
        controller: controller,
        onPageChanged: (v) {
          setState(() {
            page = v;
          });
        },
        children: const [
          Home(),
          Wallet(),
          Gift(),
          Profile(),
        ],
      ),
      bottomNavigationBar: BottomNavCustom(
        page: page,
        onTap: (v) {
          setState(() {
            controller.jumpToPage(v);
            page = v;
          });
        },
        iconButton: [
          ModelIconBottom(
            imageUrl: "assets/storage/icon_bottom/Home 41.svg",
            imageActiveUrl: "assets/storage/icon_bottom/Home 4.svg",
          ),
          ModelIconBottom(
            imageUrl: "assets/storage/icon_bottom/Wallet.svg",
            imageActiveUrl: "assets/storage/icon_bottom/Wallet2.svg",
          ),
          ModelIconBottom(
            imageUrl: "assets/storage/icon_bottom/Gift 1.svg",
            imageActiveUrl: "assets/storage/icon_bottom/Gift 2.svg",
          ),
          ModelIconBottom(
            imageUrl: "assets/storage/icon_bottom/Profile 1.svg",
            imageActiveUrl: "assets/storage/icon_bottom/Profile 2.svg",
          ),
        ],
      ),
    );
  }
}
