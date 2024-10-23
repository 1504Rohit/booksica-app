import 'dart:convert';

Address addressFromJson(String str) => Address.fromJson(json.decode(str));

String addressToJson(Address data) => json.encode(data.toJson());

class Address {
  dynamic id;
  dynamic name;
  dynamic address;
  dynamic area;
  dynamic pincode;
  dynamic city;
  dynamic state;
  dynamic phone;
  dynamic landmark;
  dynamic defaultAddress;
  dynamic disabled;
  dynamic userId;
  dynamic v;

  Address({
    required this.id,
    required this.name,
    required this.address,
    required this.area,
    required this.pincode,
    required this.city,
    required this.state,
    required this.phone,
    required this.landmark,
    required this.defaultAddress,
    required this.disabled,
    required this.userId,
    required this.v,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["_id"] ?? "",
        name: json["name"] ?? "",
        address: json["address"] ?? "",
        area: json["area"] ?? "",
        pincode: json["pincode"] ?? 123456,
        city: json["city"] ?? "",
        state: json["state"] ?? "",
        phone: json["phone"] ?? 2432656464,
        landmark: json["landmark"] ?? "",
        defaultAddress: json["defaultAddress"] ?? "",
        disabled: json["disabled"] ?? false,
        userId: json["userId"] ?? "",
        v: json["__v"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "address": address,
        "area": area,
        "pincode": pincode,
        "city": city,
        "state": state,
        "phone": phone,
        "landmark": landmark,
        "defaultAddress": defaultAddress,
        "disabled": disabled,
        "userId": userId,
        "__v": v,
      };
}
