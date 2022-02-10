import 'package:flutter/material.dart';
import 'package:test2/variable/variable_color.dart';
import 'components/card_blue.dart';
import 'components/features.dart';
import 'components/list_product.dart';
import 'components/top_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhitePrimary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              topBar(),
              cardBlue(),
              features(context),
              listProduct(),
            ],
          ),
        ),
      ),
    );
  }
}
