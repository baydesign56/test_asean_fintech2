import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:test2/controller/controller_product.dart';
import 'package:test2/models/model_products.dart';
import 'package:test2/variable/variabel_base_url.dart';
import 'package:test2/variable/variable_color.dart';

Widget listProduct() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
    child: Column(
      children: [
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Recent Product",
              style: TextStyle(
                fontSize: 17,
                color: colorBlackText,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: const [
                Text("All"),
                Icon(Icons.keyboard_arrow_down_rounded)
              ],
            )
          ],
        ),
        const SizedBox(height: 25),
        GetBuilder<ControllerProduct>(builder: (v) {
          return v.load
              ? const Center(child: CircularProgressIndicator())
              : v.errorMesage == null
                  ? Column(
                      children: [
                        for (var item in v.listProduct) cardpProduct(item),
                      ],
                    )
                  : Column(
                      children: [
                        Text(v.errorMesage ?? "Error"),
                        TextButton(
                            onPressed: () {}, child: const Text("Muat ulang"))
                      ],
                    );
        }),
      ],
    ),
  );
}

Widget cardpProduct(ModelProducts products) {
  // Random rnd = Random();
  // int im = 1 + rnd.nextInt(5 - 1);
  return Container(
    width: Get.width,
    margin: const EdgeInsets.only(bottom: 25),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(
              width: 50,
              height: 50,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(baseUrl + imageUrl + products.image!),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(products.name ?? "product",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  products.date!.day.toString() +
                      "-" +
                      products.date!.month.toString() +
                      "-" +
                      products.date!.year.toString(),
                  style: TextStyle(
                    color: colorGreyText,
                  ),
                ),
              ],
            ),
          ],
        ),
        Text(
          "Rp. " + products.price.toString(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: colorBluePrimary,
          ),
        ),
      ],
    ),
  );
}
