// To parse this JSON data, do
//
//     final modelProducts = modelProductsFromJson(jsonString);

import 'dart:convert';

List<ModelProducts> modelProductsFromJson(String str) =>
    List<ModelProducts>.from(
        json.decode(str).map((x) => ModelProducts.fromJson(x)));

String modelProductsToJson(List<ModelProducts> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelProducts {
  ModelProducts({
    this.id,
    this.name,
    this.description,
    this.price,
    this.date,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? description;
  int? price;
  DateTime? date;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory ModelProducts.fromJson(Map<String, dynamic> json) => ModelProducts(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        date: DateTime.parse(json["date"]),
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "image": image,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
