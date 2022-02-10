import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:test2/models/model_icon_bottom.dart';
import 'package:test2/variable/variable_color.dart';

class BottomNavCustom extends StatefulWidget {
  const BottomNavCustom(
      {Key? key, this.page = 0, this.onTap, required this.iconButton})
      : super(key: key);
  final int? page;
  final ValueChanged<int>? onTap;
  final List<ModelIconBottom> iconButton;

  @override
  _BottomNavCustomState createState() => _BottomNavCustomState();
}

class _BottomNavCustomState extends State<BottomNavCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 65,
      color: colorWhitePrimary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (var i = 0; i < widget.iconButton.length; i++)
            IconButton(
              onPressed: () {
                setState(() {
                  widget.onTap!(i);
                });
              },
              icon: SvgPicture.asset(widget.page == i
                  ? widget.iconButton[i].imageActiveUrl!
                  : widget.iconButton[i].imageUrl!),
            )
        ],
      ),
    );
  }
}
