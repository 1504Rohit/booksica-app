import 'package:meta/meta.dart';
import 'dart:convert';

List<SubCategories> subCategoriesFromJson(String str) =>
    List<SubCategories>.from(
        json.decode(str).map((x) => SubCategories.fromJson(x)));

String subCategoriesToJson(List<SubCategories> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SubCategories {
  String id;
  String name;
  String parentCategory;
  String icon;
  bool disabled;
  int v;
  int books;

  SubCategories({
    required this.id,
    required this.name,
    required this.parentCategory,
    required this.icon,
    required this.disabled,
    required this.v,
    required this.books,
  });

  factory SubCategories.fromJson(Map<String, dynamic> json) => SubCategories(
        id: json["_id"],
        name: json["name"],
        parentCategory: json["parentCategory"],
        icon: json["icon"],
        disabled: json["disabled"],
        v: json["__v"],
        books: json["books"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "parentCategory": parentCategory,
        "icon": icon,
        "disabled": disabled,
        "__v": v,
        "books": books,
      };
}
