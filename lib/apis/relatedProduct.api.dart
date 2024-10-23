import 'dart:convert';

import 'package:booksica/config/ApiLink.dart';
import 'package:booksica/config/userPreference.dart';
import 'package:booksica/models/allBooks.dart';
import 'package:booksica/styles/colors.dart';
import 'package:booksica/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class GetRelatedPRoducts extends GetxController {
  RxBool isLoading = false.obs;
  RxList<Product> data1 = RxList();
  Future getRelatedProduct(BuildContext context, String productId) async {
    try {
      isLoading.value = true;

      var headers = {
        'Authorization': 'Bearer ${UserPreferences.token}',
      };

      var uri =
          Uri.parse("${AppLink.baseURL}${AppLink.relatedProdcut}/${productId}");

      // Make the HTTP request
      var request = http.Request('GET', uri);
      request.headers.addAll(headers);

      // Await the response
      http.StreamedResponse response = await request.send();
      String result = await response.stream.bytesToString();
      var finalResponse = jsonDecode(result);

      // Handle the response
      if (finalResponse["success"]) {
        data1.clear();
        for (var item in finalResponse["data"]) {
          data1.add(Product.fromJson(item));
        }
        print(data1);
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
      CustSnackbar.showCustomSnackbar(
        context: context,
        message: error.toString(),
        backgroundColor: AppColors.redPrice,
      );
      isLoading.value = false;
    }
  }
}
