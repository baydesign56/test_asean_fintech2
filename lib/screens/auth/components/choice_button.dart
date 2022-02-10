import 'package:flutter/material.dart';
import 'package:test2/variable/variable_color.dart';

class ChoiceButton extends StatefulWidget {
  const ChoiceButton({Key? key, this.init = 0, required this.onTap})
      : super(key: key);
  final int? init;
  final ValueChanged<int> onTap;

  @override
  _ChoiceButtonState createState() => _ChoiceButtonState();
}

class _ChoiceButtonState extends State<ChoiceButton> {
  int i = 0;

  @override
  void initState() {
    super.initState();
    i = widget.init!;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        GestureDetector(
          onTap: () {
            setState(() {
              i = 0;
              widget.onTap(0);
            });
          },
          child: Column(
            children: [
              Text(
                "Login",
                style: TextStyle(
                  fontSize: 25,
                  color: i == 0 ? colorBluePrimary : colorGreyText,
                ),
              ),
              Container(
                width: 40,
                height: 1,
                color: i == 0 ? colorBluePrimary : Colors.transparent,
              )
            ],
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              i = 1;
              widget.onTap(1);
            });
          },
          child: Column(
            children: [
              Text(
                "Register",
                style: TextStyle(
                  fontSize: 25,
                  color: i == 1 ? colorBluePrimary : colorGreyText,
                ),
              ),
              Container(
                width: 40,
                height: 1,
                color: i == 1 ? colorBluePrimary : Colors.transparent,
              )
            ],
          ),
        )
      ]),
    );
  }
}
