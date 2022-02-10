import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test2/error/error_dio.dart';
import 'package:test2/screens/wrapper_menu/wrapper_menu.dart';
import 'package:test2/variable/variabel_base_url.dart';

class ControllerAuth extends GetxController {
  bool load = false;
  String? name;
  int timeOut = 20;
  login({required String email, required String password}) async {
    load = true;
    update();
    try {
      var response = await Dio()
          .get(baseUrl + loginUrl + "?email=$email&password=$password")
          .timeout(
            Duration(seconds: timeOut),
          );
      if (response.statusCode == 200) {
        load = false;
        if (response.data['message'] == "User not found") {
          Get.rawSnackbar(
            message: "User not found",
            backgroundColor: Colors.red,
          );
        } else if (response.data["message"] ==
            "Name or password are incorrect") {
          Get.rawSnackbar(
            message: "Name or password are incorrect",
            backgroundColor: Colors.red,
          );
        } else {
          name = email.split("@")[0];
          update();
          Get.toNamed(WrapperMenu.namePage);
        }
        update();
        log(response.data.toString());
      } else {
        load = false;
        update();
        log(response.data.toString());
        log(response.statusCode.toString());
        Get.rawSnackbar(
          message: "Somethings wrong || ${{response.statusCode}}",
          backgroundColor: Colors.red,
        );
      }
    } on DioError catch (e) {
      load = false;
      update();
      errorDio(e.type);
    }
    update();
  }

  register(
      {required String name,
      required String email,
      required String password}) async {
    load = true;
    update();
    try {
      var response = await Dio()
          .post(baseUrl +
              registerUrl +
              "?name=$name&email=$email&password=$password")
          .timeout(
            Duration(seconds: timeOut),
          );
      if (response.statusCode == 200) {
        load = false;
        update();
        if (response.data["message"] == "User already exist") {
          Get.rawSnackbar(
            message: response.data["message"],
            backgroundColor: Colors.red,
          );
        } else {
          name = name;
          update();
          Get.toNamed(WrapperMenu.namePage);
        }

        log(response.data.toString());
        update();
      } else {
        load = false;
        update();
        response.data.toString();
        response.statusCode.toString();
        Get.rawSnackbar(
          message: "Somethings wrong || ${{response.statusCode}}",
          backgroundColor: Colors.red,
        );
      }
    } on DioError catch (e) {
      load = false;
      update();
      errorDio(e.type);
    }
  }
}
