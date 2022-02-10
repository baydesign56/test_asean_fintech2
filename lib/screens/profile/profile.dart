import 'package:flutter/material.dart';
import 'package:test2/variable/variable_color.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhitePrimary,
      body: const Center(
        child: Text("Profile"),
      ),
    );
  }
}
