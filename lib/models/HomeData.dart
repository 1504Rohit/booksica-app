// To parse this JSON data, do
//
//     final homeData = homeDataFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

HomeData homeDataFromJson(String str) => HomeData.fromJson(json.decode(str));

String homeDataToJson(HomeData data) => json.encode(data.toJson());

class HomeData {
  String title;
  String description;
  String author;
  String website;
  String linkedin;
  List<HomeSlider> homeSlider;
  List<AllCategory> allCategory;
  List<dynamic> genreBanner;
  List<HomeSlider> offerBanner;
  List<Section> sections;
  List<BestSeller> bestSeller;
  List<HomeSlider> offerExpiresBanner;
  List<Author> allAuthors;
  List<dynamic> singleBookBanner;

  HomeData({
    required this.title,
    required this.description,
    required this.author,
    required this.website,
    required this.linkedin,
    required this.homeSlider,
    required this.allCategory,
    required this.genreBanner,
    required this.offerBanner,
    required this.sections,
    required this.bestSeller,
    required this.offerExpiresBanner,
    required this.allAuthors,
    required this.singleBookBanner,
  });

  factory HomeData.fromJson(Map<String, dynamic> json) => HomeData(
        title: json["title"] ?? "",
        description: json["description"] ?? "",
        author: json["author"] ?? "",
        website: json["website"] ?? "",
        linkedin: json["linkedin"] ?? "",
        homeSlider: json["homeSlider"] != null
            ? List<HomeSlider>.from(
                json["homeSlider"].map((x) => HomeSlider.fromJson(x)))
            : [],
        allCategory: json["allCategory"] != null
            ? List<AllCategory>.from(
                json["allCategory"].map((x) => AllCategory.fromJson(x)))
            : [],
        genreBanner: json["genreBanner"] != null
            ? List<dynamic>.from(json["genreBanner"].map((x) => x))
            : [],
        offerBanner: json["offerBanner"] != null
            ? List<HomeSlider>.from(
                json["offerBanner"].map((x) => HomeSlider.fromJson(x)))
            : [],
        sections: json["sections"] != null
            ? List<Section>.from(
                json["sections"].map((x) => Section.fromJson(x)))
            : [],
        bestSeller: json["bestSeller"] != null
            ? List<BestSeller>.from(
                json["bestSeller"].map((x) => BestSeller.fromJson(x)))
            : [],
        offerExpiresBanner: json["offerExpiresBanner"] != null
            ? List<HomeSlider>.from(
                json["offerExpiresBanner"].map((x) => HomeSlider.fromJson(x)))
            : [],
        allAuthors: json["allAuthors"] != null
            ? List<Author>.from(
                json["allAuthors"].map((x) => Author.fromJson(x)))
            : [],
        singleBookBanner: json["singleBookBanner"] != null
            ? List<dynamic>.from(json["singleBookBanner"].map((x) => x))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "author": author,
        "website": website,
        "linkedin": linkedin,
        "homeSlider": List<dynamic>.from(homeSlider.map((x) => x.toJson())),
        "allCategory": List<dynamic>.from(allCategory.map((x) => x.toJson())),
        "genreBanner": List<dynamic>.from(genreBanner.map((x) => x)),
        "offerBanner": List<dynamic>.from(offerBanner.map((x) => x.toJson())),
        "sections": List<dynamic>.from(sections.map((x) => x.toJson())),
        "bestSeller": List<dynamic>.from(bestSeller.map((x) => x.toJson())),
        "offerExpiresBanner":
            List<dynamic>.from(offerExpiresBanner.map((x) => x.toJson())),
        "allAuthors": List<dynamic>.from(allAuthors.map((x) => x.toJson())),
        "singleBookBanner": List<dynamic>.from(singleBookBanner.map((x) => x)),
      };
}

class Author {
  String id;
  String name;
  String aboutAuthor;
  String photo;
  bool disabled;
  bool display;
  int v;

  Author({
    required this.id,
    required this.name,
    required this.aboutAuthor,
    required this.photo,
    required this.disabled,
    required this.display,
    required this.v,
  });

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        id: json["_id"] ?? "",
        name: json["name"] ?? "",
        aboutAuthor: json["aboutAuthor"] ?? "",
        photo: json["photo"] ?? "",
        disabled: json["disabled"] ?? false,
        display: json["display"] ?? false,
        v: json["__v"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "aboutAuthor": aboutAuthor,
        "photo": photo,
        "disabled": disabled,
        "display": display,
        "__v": v,
      };
}

class AllCategory {
  String id;
  String name;
  dynamic parentCategory;
  String icon;
  bool disabled;
  int v;

  AllCategory({
    required this.id,
    required this.name,
    required this.parentCategory,
    required this.icon,
    required this.disabled,
    required this.v,
  });

  factory AllCategory.fromJson(Map<String, dynamic> json) => AllCategory(
        id: json["_id"] ?? "",
        name: json["name"] ?? "",
        parentCategory: json["parentCategory"] ?? "",
        icon: json["icon"] ?? "",
        disabled: json["disabled"] ?? false,
        v: json["__v"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "parentCategory": parentCategory,
        "icon": icon,
        "disabled": disabled,
        "__v": v,
      };
}

class BestSeller {
  String id;
  String title;
  int discount;
  String thumbnail;
  int mrp;
  Author author;
  int price;

  BestSeller({
    required this.id,
    required this.title,
    required this.discount,
    required this.thumbnail,
    required this.mrp,
    required this.author,
    required this.price,
  });

  factory BestSeller.fromJson(Map<String, dynamic> json) => BestSeller(
        id: json["_id"] ?? "",
        title: json["title"] ?? "",
        discount: json["discount"] ?? 0,
        thumbnail: json["thumbnail"] ?? "",
        mrp: json["mrp"] ?? 0,
        author: json["author"] != null
            ? Author.fromJson(json["author"])
            : Author(
                id: "",
                name: "",
                aboutAuthor: "",
                photo: "",
                disabled: false,
                display: false,
                v: 0),
        price: json["price"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "discount": discount,
        "thumbnail": thumbnail,
        "mrp": mrp,
        "author": author.toJson(),
        "price": price,
      };
}

class HomeSlider {
  String id;
  String heading;
  String title;
  String description;
  String homeSliderFor;
  String productType;
  String color;
  String type;
  String section;
  bool disabled;
  String image;
  int v;
  DateTime expiry;
  String product;

  HomeSlider({
    required this.id,
    required this.heading,
    required this.title,
    required this.description,
    required this.homeSliderFor,
    required this.productType,
    required this.color,
    required this.type,
    required this.section,
    required this.disabled,
    required this.image,
    required this.v,
    required this.expiry,
    required this.product,
  });

  factory HomeSlider.fromJson(Map<String, dynamic> json) => HomeSlider(
        id: json["_id"] ?? "",
        heading: json["heading"] ?? "",
        title: json["title"] ?? "",
        description: json["description"] ?? "",
        homeSliderFor: json["for"] ?? "",
        productType: json["productType"] ?? "",
        color: json["color"] ?? "",
        type: json["type"] ?? "",
        section: json["section"] ?? "",
        disabled: json["disabled"] ?? false,
        image: json["image"] ?? "",
        v: json["__v"] ?? 0,
        expiry: json["expiry"] != null
            ? DateTime.parse(json["expiry"])
            : DateTime.now(),
        product: json["product"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "heading": heading,
        "title": title,
        "description": description,
        "for": homeSliderFor,
        "productType": productType,
        "color": color,
        "type": type,
        "section": section,
        "disabled": disabled,
        "image": image,
        "__v": v,
        "expiry": expiry.toIso8601String(),
        "product": product,
      };
}

class Section {
  String id;
  String name;
  int serial;
  String type;
  List<BestSeller> products;
  bool disabled;
  bool display;
  int v;

  Section({
    required this.id,
    required this.name,
    required this.serial,
    required this.type,
    required this.products,
    required this.disabled,
    required this.display,
    required this.v,
  });

  factory Section.fromJson(Map<String, dynamic> json) => Section(
        id: json["_id"] ?? "",
        name: json["name"] ?? "",
        serial: json["serial"] ?? 0,
        type: json["type"] ?? "",
        products: json["products"] != null
            ? List<BestSeller>.from(
                json["products"].map((x) => BestSeller.fromJson(x)))
            : [],
        disabled: json["disabled"] ?? false,
        display: json["display"] ?? false,
        v: json["__v"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "serial": serial,
        "type": type,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "disabled": disabled,
        "display": display,
        "__v": v,
      };
}
