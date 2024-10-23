import 'dart:convert';
import 'package:booksica/config/ApiLink.dart';
import 'package:booksica/config/userPreference.dart';
import 'package:booksica/models/HomeData.dart';
import 'package:booksica/styles/colors.dart';
import 'package:booksica/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

class HomeApi extends GetxController {
  RxList<HomeData> data = RxList();
  RxBool isLoading = false.obs;
  Future getHomeApi(BuildContext context) async {
    isLoading.value = true;
    try {
      var headers = {
        'Authorization': 'Bearer ${UserPreferences.token}',
      };
      var body = jsonEncode({});
      var request =
          http.Request('GET', Uri.parse(AppLink.baseURL + AppLink.homeApi));

      request.headers.addAll(headers);
      request.body = body;
      http.StreamedResponse response = await request.send();
      String result = await response.stream.bytesToString();
      var finalResponse = jsonDecode(result);

      if (finalResponse["success"]) {
        if (data.length == 0) {
          data.add(HomeData.fromJson(finalResponse["data"]));
          print(data[0].homeSlider[0].id);
        } else {
          data.clear();
        }
        isLoading.value = false;
      } else {
        CustSnackbar.showCustomSnackbar(
            context: context,
            message: finalResponse["message"],
            backgroundColor: AppColors.redPrice);
        isLoading.value = false;
      }
    } catch (error) {
      CustSnackbar.showCustomSnackbar(
          context: context,
          message: error.toString(),
          backgroundColor: AppColors.redPrice);
      isLoading.value = false;
    }
  }
}
