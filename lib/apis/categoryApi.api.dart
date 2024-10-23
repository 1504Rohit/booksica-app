import 'dart:convert';
import 'package:booksica/config/ApiLink.dart';
import 'package:booksica/config/userPreference.dart';
import 'package:booksica/models/subCategories.dart';
import 'package:http/http.dart' as http;
import 'package:booksica/styles/colors.dart';
import 'package:booksica/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryApi extends GetxController {
  RxList<SubCategories> data1 = RxList();
  Future<List<SubCategories>> getCategories(BuildContext context) async {
    RxList<SubCategories> data = RxList();
    try {
      var headers = {
        'Authorization': 'Bearer ${UserPreferences.token}',
      };
      var body = jsonEncode({});
      var request = http.Request(
          'GET', Uri.parse(AppLink.baseURL + AppLink.getParentCategory));

      request.headers.addAll(headers);
      request.body = body;
      http.StreamedResponse response = await request.send();
      String result = await response.stream.bytesToString();
      var finalResponse = jsonDecode(result);

      if (finalResponse["success"]) {
        data1.clear();
        for (int i = 0; i < finalResponse["data"].length; i++) {
          data.add(SubCategories.fromJson(finalResponse["data"][i]));
          data1.add(SubCategories.fromJson(finalResponse["data"][i]));
        }

        return data;
      } else {
        CustSnackbar.showCustomSnackbar(
            context: context,
            message: finalResponse["message"],
            backgroundColor: AppColors.redPrice);
      }
    } catch (error) {
      CustSnackbar.showCustomSnackbar(
          context: context,
          message: error.toString(),
          backgroundColor: AppColors.redPrice);
    }
    return data;
  }
}
