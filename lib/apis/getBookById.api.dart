import 'dart:convert';
import 'package:booksica/config/ApiLink.dart';
import 'package:booksica/config/userPreference.dart';
import 'package:booksica/models/productDetail.dart';
import 'package:booksica/styles/colors.dart';
import 'package:booksica/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class GetBookById extends GetxController {
  Rx<ProductDetail> data = ProductDetail.fromJson({
    "dimensions": {"length": null, "breadth": null, "height": null},
    "seoAuthors": [],
    "_id": "6593bf3dea5b55c2cd2ee6ca",
    "title": "Riich Dad Poor Dad",
    "description":
        "Rich Dad Poor Dad is a 1997 book written by Robert T. Kiyosaki and Sharon Lechter. It advocates the importance of financial literacy (financial education), financial independence and building wealth through investing in assets, real estate investing, starting and owning businesses, as well as increasing one's financial intelligence (financial IQ).                                                                                                                                                               Rich Dad Poor Dad is written in the style of a set of parables, ostensibly based on Kiyosaki's life. The titular \"rich dad\" is his best friend's father who accumulated wealth due to entrepreneurship and savvy investing, while the \"poor dad\" is claimed to be Kiyosaki's own father who he says worked hard all his life but never obtained financial security.",
    "discount": 65,
    "thumbnail": "1711696076423Rich Dad Poor Dad.png",
    "photos": [
      "1708765327557KMyZ@Ln3k (15).png",
      "17116995002373a41b9e857b86e967962263cfdb3f85b.jpg"
    ],
    "specifications": [
      {
        "key": "Publisher",
        "value": "PLATA PUBLISHING",
        "_id": "6606762cde17e77d6a619e89"
      },
      {
        "key": "Language",
        "value": "English",
        "_id": "6606762cde17e77d6a619e8a"
      },
      {
        "key": "ISBN-10",
        "value": "1612681131",
        "_id": "6606762cde17e77d6a619e8b"
      },
      {
        "key": "Item Weight",
        "value": "240 g",
        "_id": "6606762cde17e77d6a619e8c"
      },
      {
        "key": "Dimensions",
        "value": "19.7 x 12.9 x 2.03 cm",
        "_id": "6606762cde17e77d6a619e8d"
      },
      {
        "key": "Country of Origin",
        "value": "India",
        "_id": "6606762cde17e77d6a619e8e"
      },
      {
        "key": "Reading age",
        "value": "Suggested age: 14 years and up",
        "_id": "6606762cde17e77d6a619e8f"
      }
    ],
    "weight": 0.24,
    "mrp": 399,
    "rentPrice": 40,
    "stock": 2088,
    "conditionalPrices": [],
    "subCategory": "6593bb85ea5b55c2cd2ee66a",
    "metaTags": [],
    "author": {
      "_id": "6593b934ea5b55c2cd2ee65b",
      "name": "Robert T. Kiyosaki",
      "photo": "1704180039134robert-kiyosaki.jpg"
    },
    "disabled": false,
    "publisher": "6593bd8bea5b55c2cd2ee685",
    "__v": 1,
    "price": 139,
    "returnableDays": 7,
    "cancellation": false,
    "returnable": false,
    "sold": 296,
    "bestSeller": true,
    "updatedAt": "2024-09-28T08:09:59.802Z"
  }).obs;
  RxBool isLoading = false.obs;
  Future getBookById(BuildContext context, {required String id}) async {
    isLoading.value = true;
    try {
      var headers = {
        'Authorization': 'Bearer ${UserPreferences.token}',
      };

      var uri = Uri.parse("${AppLink.baseURL}${AppLink.getBookById}/${id}");

      // Make the HTTP request
      var request = http.Request('GET', uri);
      request.headers.addAll(headers);

      // Await the response
      http.StreamedResponse response = await request.send();
      String result = await response.stream.bytesToString();
      var finalResponse = jsonDecode(result);

      if (finalResponse["success"]) {
        data.value = ProductDetail.fromJson(finalResponse["data"]);
        print(data);
        isLoading.value = false;
      } else {
        CustSnackbar.showCustomSnackbar(
          context: context,
          message: finalResponse["message"],
          backgroundColor: AppColors.redPrice,
        );
        isLoading.value = false;
      }
    } catch (error) {
      isLoading.value = false;
      CustSnackbar.showCustomSnackbar(
        context: context,
        message: error.toString(),
        backgroundColor: AppColors.redPrice,
      );
    }
  }
}
