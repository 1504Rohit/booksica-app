import 'dart:convert';
import 'package:booksica/apis/categoryApi.api.dart';
import 'package:booksica/apis/homeApi.api.dart';
import 'package:booksica/config/ApiLink.dart';
import 'package:booksica/config/userPreference.dart';
import 'package:booksica/controller/bottomSheet.controller.dart';
import 'package:booksica/models/allBooks.dart';
import 'package:booksica/styles/colors.dart';
import 'package:booksica/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class GetAllBooksApi extends GetxController {
  HomeApi homeApi = Get.put(HomeApi());
  BottomSheetController bottomSheetController =
      Get.put(BottomSheetController());
  RxBool isLoading = false.obs;
  RxList<Product> data1 = RxList();

  Future<List<Product>> getAllBooks(
    BuildContext context, {
    String? search,
    String? user,
    String? sort,
    String? category,
    String? author,
    String? section,
    String? minPrice,
    String? maxPrice,
  }) async {
    // Assign the selected author if any
    data1.clear();

    // Loading indicator
    isLoading.value = true;

    try {
      // Prepare headers
      var headers = {
        'Authorization': 'Bearer ${UserPreferences.token}',
      };

      // Build the URI dynamically
      var queryParams = {
        if (search != null) 'search': search,
        if (user != null) 'user': user,
        if (sort != null) 'sort': sort,
        if (category != null) 'category': category,
        if (author != null) 'author': author,
        if (section != null) 'section': section,
        if (minPrice != null) 'minPrice': minPrice.toString(),
        if (maxPrice != null) 'maxPrice': maxPrice.toString(),
        'disable': 'null', // Always set 'disable' to null
      };

      var uri = Uri.parse("${AppLink.baseURL}${AppLink.getAllBooks}")
          .replace(queryParameters: queryParams);

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
        isLoading.value = false;
        return data1;
      } else {
        CustSnackbar.showCustomSnackbar(
          context: context,
          message: finalResponse["message"],
          backgroundColor: AppColors.redPrice,
        );
        isLoading.value = false;
      }
    } catch (error) {
      print(error.toString());
      CustSnackbar.showCustomSnackbar(
        context: context,
        message: error.toString(),
        backgroundColor: AppColors.redPrice,
      );
      isLoading.value = false;
    }
    return data1;
  }
}
