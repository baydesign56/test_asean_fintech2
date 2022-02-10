import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:test2/controller/controller_auth.dart';
import 'package:test2/variable/variable_color.dart';

import 'components/choice_button.dart';

class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);
  static String namePage = "/auth";

  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  // bool isLogin = true;
  ControllerAuth auth = Get.put(ControllerAuth());

  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  FocusNode fEmail = FocusNode();
  FocusNode fName = FocusNode();
  FocusNode fPassword = FocusNode();

  Widget textTop() {
    return Column(
      children: [
        const Text(
          "Login",
          style: TextStyle(
            fontSize: 40,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text.rich(
            TextSpan(
              style: const TextStyle(
                fontSize: 23,
                color: Color(0xFF6B5E5E),
              ),
              children: [
                const TextSpan(
                  text: 'By signing in you are agreeing \nour ',
                ),
                TextSpan(
                  text: 'Term and privacy policy',
                  style: TextStyle(
                    color: colorBluePrimary,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }

  bool isObs = true;
  Widget formAuth({
    required String hint,
    required String svgAssets,
    bool? onShow,
    FocusNode? focusNode,
    TextEditingController? controller,
  }) {
    return TextField(
      focusNode: focusNode,
      controller: controller,
      obscureText: onShow == null ? false : isObs,
      style: const TextStyle(fontSize: 22),
      onChanged: (v) {
        setState(() {});
      },
      decoration: InputDecoration(
        hintText: hint,
        suffixIconConstraints: const BoxConstraints(
          maxHeight: 25,
          minWidth: 25,
        ),
        suffixIcon: onShow == null
            ? null
            : GestureDetector(
                onTap: () {
                  log("pencet");
                  setState(() {
                    !isObs ? isObs = true : isObs = false;
                  });
                },
                child: SvgPicture.asset(
                  isObs
                      ? "assets/storage/Group 2.svg"
                      : "assets/storage/Group 90.svg",
                ),
              ),
        prefixIconConstraints: const BoxConstraints(
          maxHeight: 25,
          minWidth: 25,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: SvgPicture.asset(
            svgAssets,
          ),
        ),
      ),
    );
  }

  int init = 0;
  bool remember = false;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(fontFamily: "MAJ"),
      child: GestureDetector(
        onTap: () {
          setState(() {
            fEmail.unfocus();
            fPassword.unfocus();
            fName.unfocus();
          });
        },
        child: Scaffold(
          backgroundColor: colorWhitePrimary,
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: SizedBox(
                      width: Get.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          textTop(),
                          const SizedBox(
                            height: 30,
                          ),
                          ChoiceButton(
                            init: init,
                            onTap: (i) {
                              setState(() {
                                init = i;
                              });
                              log(i.toString());
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Column(
                            children: [
                              init == 1
                                  ? Column(
                                      children: [
                                        formAuth(
                                          hint: "Name",
                                          svgAssets:
                                              "assets/storage/icon_bottom/Profile 1.svg",
                                          controller: name,
                                          focusNode: fName,
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    )
                                  : const SizedBox(
                                      width: 0,
                                      height: 0,
                                    ),
                              formAuth(
                                hint: "Email Address",
                                svgAssets: "assets/storage/mail.svg",
                                controller: email,
                                focusNode: fEmail,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              formAuth(
                                svgAssets: "assets/storage/lock.svg",
                                hint: "Password",
                                onShow: true,
                                controller: password,
                                focusNode: fPassword,
                              ),
                              Row(
                                children: [
                                  Flexible(
                                    child: CheckboxListTile(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        horizontal: 0,
                                      ),

                                      title: const Text(
                                        "Remember password",
                                        style:
                                            TextStyle(color: Color(0xFF6B5E5E)),
                                      ),
                                      value: remember,
                                      onChanged: (newValue) {
                                        setState(() {
                                          remember = newValue!;
                                        });
                                      },
                                      controlAffinity: ListTileControlAffinity
                                          .leading, //  <-- leading Checkbox
                                    ),
                                  ),
                                  Flexible(
                                    child: ListTile(
                                      onTap: () {},
                                      title: Align(
                                          alignment: Alignment.centerRight,
                                          child: Text("Forget password",
                                              style: TextStyle(
                                                  color: colorBluePrimary))),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (init == 0) {
                                    email.text.isEmail
                                        ? email.text.isEmpty ||
                                                password.text.isEmpty
                                            ? Get.rawSnackbar(
                                                message:
                                                    "please complete your form",
                                                backgroundColor: Colors.red,
                                              )
                                            : auth.login(
                                                email: email.text,
                                                password: password.text)
                                        : Get.rawSnackbar(
                                            message:
                                                "please complete your form email",
                                            backgroundColor: Colors.red,
                                          );
                                  } else {
                                    email.text.isEmail
                                        ? name.text.isEmpty ||
                                                email.text.isEmpty ||
                                                password.text.isEmpty
                                            ? Get.rawSnackbar(
                                                message:
                                                    "please complete your form",
                                                backgroundColor: Colors.red,
                                              )
                                            : auth.register(
                                                name: name.text,
                                                email: email.text,
                                                password: password.text)
                                        : Get.rawSnackbar(
                                            message:
                                                "please complete your form email",
                                            backgroundColor: Colors.red,
                                          );
                                  }
                                },
                                child: Container(
                                  width: Get.width,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: email.text.isEmpty ||
                                            password.text.isEmpty
                                        ? colorGreyText
                                        : colorBlueButton,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(child:
                                      GetBuilder<ControllerAuth>(builder: (v) {
                                    return v.load
                                        ? const CircularProgressIndicator(
                                            color: Colors.white,
                                          )
                                        : Text(
                                            init == 0 ? "Login" : "Register",
                                            style: TextStyle(
                                              color: colorWhitePrimary,
                                              fontSize: 25,
                                            ),
                                          );
                                  })),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "or connect with",
                                style: TextStyle(
                                  color: colorGreyText,
                                  fontSize: 25,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Wrap(
                                spacing: 15,
                                runSpacing: 15,
                                children: [
                                  for (var i = 0; i < 4; i++)
                                    Image.asset(
                                      "assets/storage/icon$i.png",
                                      width: 45,
                                    )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: Get.width,
                    height: 200,
                    color: Colors.transparent,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: Image.asset("assets/storage/image 11.png"),
                        ),
                        Positioned(
                          top: -20,
                          left: 0,
                          right: 0,
                          child: SvgPicture.asset(
                            "assets/storage/Subtract.svg",
                          ),
                        ),
                        Positioned(
                          bottom: 15,
                          left: 0,
                          right: 0,
                          child: Column(children: [
                            Image.asset("assets/storage/Frame 450.png",
                                width: 60),
                            Text(
                              "Login wit touch ID",
                              style: TextStyle(
                                color: colorWhitePrimary,
                                fontSize: 25,
                              ),
                            ),
                          ]),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
