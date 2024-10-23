import 'package:meta/meta.dart';
import 'dart:convert';

ProductDetail productDetailFromJson(String str) =>
    ProductDetail.fromJson(json.decode(str));

String productDetailToJson(ProductDetail data) => json.encode(data.toJson());

class ProductDetail {
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
  String subCategory;
  List<dynamic> metaTags;
  Author author;
  bool disabled;
  String publisher;
  int v;
  int price;
  int returnableDays;
  bool cancellation;
  bool returnable;
  int sold;
  bool bestSeller;
  DateTime updatedAt;

  ProductDetail({
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
    required this.price,
    required this.returnableDays,
    required this.cancellation,
    required this.returnable,
    required this.sold,
    required this.bestSeller,
    required this.updatedAt,
  });

  factory ProductDetail.fromJson(Map<String, dynamic> json) => ProductDetail(
        dimensions: json["dimensions"] != null
            ? Dimensions.fromJson(json["dimensions"])
            : Dimensions(length: 0, breadth: 0, height: 0),
        seoAuthors: json["seoAuthors"] != null
            ? List<dynamic>.from(json["seoAuthors"].map((x) => x ?? ""))
            : [],
        id: json["_id"] ?? "",
        title: json["title"] ?? "",
        description: json["description"] ?? "",
        discount: json["discount"] ?? 0,
        thumbnail: json["thumbnail"] ?? "",
        photos: json["photos"] != null
            ? List<String>.from(json["photos"].map((x) => x ?? ""))
            : [],
        specifications: json["specifications"] != null
            ? List<Specification>.from(json["specifications"]
                .map((x) => Specification.fromJson(x ?? {})))
            : [],
        weight: json["weight"] != null ? json["weight"].toDouble() : 0.0,
        mrp: json["mrp"] ?? 0,
        rentPrice: json["rentPrice"] ?? 0,
        stock: json["stock"] ?? 0,
        conditionalPrices: json["conditionalPrices"] != null
            ? List<dynamic>.from(json["conditionalPrices"].map((x) => x ?? 0.0))
            : [],
        subCategory: json["subCategory"] ?? "",
        metaTags: json["metaTags"] != null
            ? List<dynamic>.from(json["metaTags"].map((x) => x ?? ""))
            : [],
        author: json["author"] != null
            ? Author.fromJson(json["author"])
            : Author(id: "", name: "", photo: ""),
        disabled: json["disabled"] ?? false,
        publisher: json["publisher"] ?? "",
        v: json["__v"] ?? 0,
        price: json["price"] ?? 0,
        returnableDays: json["returnableDays"] ?? 0,
        cancellation: json["cancellation"] ?? false,
        returnable: json["returnable"] ?? false,
        sold: json["sold"] ?? 0,
        bestSeller: json["bestSeller"] ?? false,
        updatedAt: json["updatedAt"] != null
            ? DateTime.parse(json["updatedAt"])
            : DateTime.now(),
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
        "subCategory": subCategory,
        "metaTags": List<dynamic>.from(metaTags.map((x) => x)),
        "author": author.toJson(),
        "disabled": disabled,
        "publisher": publisher,
        "__v": v,
        "price": price,
        "returnableDays": returnableDays,
        "cancellation": cancellation,
        "returnable": returnable,
        "sold": sold,
        "bestSeller": bestSeller,
        "updatedAt": updatedAt.toIso8601String(),
      };
}

class Author {
  String id;
  String name;
  String photo;

  Author({
    required this.id,
    required this.name,
    required this.photo,
  });

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        id: json["_id"] ?? "",
        name: json["name"] ?? "",
        photo: json["photo"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "photo": photo,
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
        length: json["length"] ?? 0.0,
        breadth: json["breadth"] ?? 0.0,
        height: json["height"] ?? 0.0,
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
