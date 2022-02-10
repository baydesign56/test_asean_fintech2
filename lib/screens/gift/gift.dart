import 'package:flutter/material.dart';
import 'package:test2/variable/variable_color.dart';

class Gift extends StatefulWidget {
  const Gift({Key? key}) : super(key: key);

  @override
  _GiftState createState() => _GiftState();
}

class _GiftState extends State<Gift> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhitePrimary,
      body: const Center(
        child: Text("Gift"),
      ),
    );
  }
}
