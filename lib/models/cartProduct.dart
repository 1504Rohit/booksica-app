// To parse this JSON data, do
//
//     final cartProduct = cartProductFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<CartProduct> cartProductFromJson(String str) => List<CartProduct>.from(
    json.decode(str).map((x) => CartProduct.fromJson(x)));

String cartProductToJson(List<CartProduct> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartProduct {
  String id;
  Product product;
  int quantity;
  String type;
  String userId;
  int v;

  CartProduct({
    required this.id,
    required this.product,
    required this.quantity,
    required this.type,
    required this.userId,
    required this.v,
  });

  factory CartProduct.fromJson(Map<String, dynamic> json) => CartProduct(
        id: json["_id"] ?? "", // Fallback to empty string if null
        product: Product.fromJson(json["product"] ?? {}),
        quantity: json["quantity"] ?? 0, // Default quantity to 0 if null
        type: json["type"] ?? "", // Default type to empty string if null
        userId: json["userId"] ?? "", // Default userId to empty string if null
        v: json["__v"] ?? 0, // Default version to 0 if null
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "product": product.toJson(),
        "quantity": quantity,
        "type": type,
        "userId": userId,
        "__v": v,
      };
}

class Product {
  Dimensions dimensions;
  List<dynamic> seoAuthors;
  String id;
  String title;
  String description;
  int discount;
  String thumbnail;
  List<String> photos;
  List<Specification> specifications;
  double weight;
  int mrp;
  int rentPrice;
  int stock;
  List<dynamic> conditionalPrices;
  Author subCategory;
  List<String> metaTags;
  Author author;
  bool disabled;
  String publisher;
  int v;
  bool cancellation;
  bool returnable;
  int returnableDays;
  int price;
  int sold;
  bool bestSeller;

  Product({
    required this.dimensions,
    required this.seoAuthors,
    required this.id,
    required this.title,
    required this.description,
    required this.discount,
    required this.thumbnail,
    required this.photos,
    required this.specifications,
    required this.weight,
    required this.mrp,
    required this.rentPrice,
    required this.stock,
    required this.conditionalPrices,
    required this.subCategory,
    required this.metaTags,
    required this.author,
    required this.disabled,
    required this.publisher,
    required this.v,
    required this.cancellation,
    required this.returnable,
    required this.returnableDays,
    required this.price,
    required this.sold,
    required this.bestSeller,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        dimensions: Dimensions.fromJson(json["dimensions"] ?? {}),
        seoAuthors: List<dynamic>.from(json["seoAuthors"]?.map((x) => x) ?? []),
        id: json["_id"] ?? "",
        title: json["title"] ?? "",
        description: json["description"] ?? "",
        discount: json["discount"] ?? 0,
        thumbnail: json["thumbnail"] ?? "",
        photos: List<String>.from(json["photos"]?.map((x) => x) ?? []),
        specifications: List<Specification>.from(
            json["specifications"]?.map((x) => Specification.fromJson(x)) ??
                []),
        weight: json["weight"]?.toDouble() ?? 0.0,
        mrp: json["mrp"] ?? 0,
        rentPrice: json["rentPrice"] ?? 0,
        stock: json["stock"] ?? 0,
        conditionalPrices:
            List<dynamic>.from(json["conditionalPrices"]?.map((x) => x) ?? []),
        subCategory: Author.fromJson(json["subCategory"] ?? {}),
        metaTags: List<String>.from(json["metaTags"]?.map((x) => x) ?? []),
        author: Author.fromJson(json["author"] ?? {}),
        disabled: json["disabled"] ?? false,
        publisher: json["publisher"] ?? "",
        v: json["__v"] ?? 0,
        cancellation: json["cancellation"] ?? false,
        returnable: json["returnable"] ?? false,
        returnableDays: json["returnableDays"] ?? 0,
        price: json["price"] ?? 0,
        sold: json["sold"] ?? 0,
        bestSeller: json["bestSeller"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "dimensions": dimensions.toJson(),
        "seoAuthors": List<dynamic>.from(seoAuthors.map((x) => x)),
        "_id": id,
        "title": title,
        "description": description,
        "discount": discount,
        "thumbnail": thumbnail,
        "photos": List<dynamic>.from(photos.map((x) => x)),
        "specifications":
            List<dynamic>.from(specifications.map((x) => x.toJson())),
        "weight": weight,
        "mrp": mrp,
        "rentPrice": rentPrice,
        "stock": stock,
        "conditionalPrices":
            List<dynamic>.from(conditionalPrices.map((x) => x)),
        "subCategory": subCategory.toJson(),
        "metaTags": List<dynamic>.from(metaTags.map((x) => x)),
        "author": author.toJson(),
        "disabled": disabled,
        "publisher": publisher,
        "__v": v,
        "cancellation": cancellation,
        "returnable": returnable,
        "returnableDays": returnableDays,
        "price": price,
        "sold": sold,
        "bestSeller": bestSeller,
      };
}

class Author {
  String id;
  String name;

  Author({
    required this.id,
    required this.name,
  });

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        id: json["_id"] ?? "",
        name: json["name"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
      };
}

class Dimensions {
  dynamic length;
  dynamic breadth;
  dynamic height;

  Dimensions({
    required this.length,
    required this.breadth,
    required this.height,
  });

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
        length: json["length"] ?? 0,
        breadth: json["breadth"] ?? 0,
        height: json["height"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "length": length,
        "breadth": breadth,
        "height": height,
      };
}

class Specification {
  String key;
  String value;
  String id;

  Specification({
    required this.key,
    required this.value,
    required this.id,
  });

  factory Specification.fromJson(Map<String, dynamic> json) => Specification(
        key: json["key"] ?? "",
        value: json["value"] ?? "",
        id: json["_id"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "value": value,
        "_id": id,
      };
}
