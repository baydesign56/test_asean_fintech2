import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:test2/error/error_dio.dart';
import 'package:test2/models/model_products.dart';
import 'package:test2/variable/variabel_base_url.dart';

class ControllerProduct extends GetxController {
  bool load = false;
  List<ModelProducts> listProduct = [];
  String? errorMesage;
  int timeOut = 20;

  getProduct() async {
    load = true;
    errorMesage = null;
    update();
    try {
      var response = await Dio().get(baseUrl + products).timeout(
            Duration(seconds: timeOut),
          );
      if (response.statusCode == 200) {
        load = false;
        var data = json.encode(response.data);
        listProduct = modelProductsFromJson(data);
        log(listProduct.length.toString());
        update();
      } else {
        load = false;
        errorMesage = "Error  ${response.statusCode}";
        update();
        log(response.statusCode.toString());
      }
    } on DioError catch (e) {
      load = false;
      update();
      errorString(e.type).then((value) {
        errorMesage = value;
        update();
      });
    }
  }
}
