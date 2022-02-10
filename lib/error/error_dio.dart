import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<String> errorString(DioErrorType type) async {
  switch (type) {
    case DioErrorType.cancel:
      return "Error canceled";
    case DioErrorType.connectTimeout:
      return "Request timeout";
    case DioErrorType.sendTimeout:
      return "Send timeout";
    case DioErrorType.receiveTimeout:
      return "Revice timeout";
    case DioErrorType.response:
      return "Error response";
    case DioErrorType.other:
      return "Error somethings wrong";
  }
}

errorDio(DioErrorType type) {
  switch (type) {
    case DioErrorType.cancel:
      Get.rawSnackbar(
        message: "Error canceled",
        backgroundColor: Colors.red,
      );
      break;
    case DioErrorType.connectTimeout:
      Get.rawSnackbar(
        message: "Request timeout",
        backgroundColor: Colors.red,
      );
      break;
    case DioErrorType.sendTimeout:
      Get.rawSnackbar(
        message: "Send timeout",
        backgroundColor: Colors.red,
      );
      break;
    case DioErrorType.receiveTimeout:
      Get.rawSnackbar(
        message: "Revice timeout",
        backgroundColor: Colors.red,
      );
      break;
    case DioErrorType.response:
      Get.rawSnackbar(
        message: "Error response",
        backgroundColor: Colors.red,
      );
      break;
    case DioErrorType.other:
      Get.rawSnackbar(
        message: "Error somethings wrong",
        backgroundColor: Colors.red,
      );
      break;
  }
}
