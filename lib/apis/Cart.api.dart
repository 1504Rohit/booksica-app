import 'dart:convert';
import 'package:booksica/config/ApiLink.dart';
import 'package:booksica/config/userPreference.dart';
import 'package:booksica/models/cartProduct.dart';
import 'package:booksica/styles/colors.dart';
import 'package:booksica/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CartApis extends GetxController {
  RxList<CartProduct> CartData = RxList();
  RxList<Map<String, dynamic>> checkoutsummary = RxList();
  Future getAllCartItems(BuildContext context) async {
    checkoutsummary.add({
      "cartTotal": 0,
      "subtotal": 0,
      "totalDiscount": 0,
      "shippingCharge": null,
      "netPayableAmount": 0
    });
    try {
      var headers = {
        'Authorization': 'Bearer ${UserPreferences.token}',
      };

      var uri = Uri.parse(
          "${AppLink.baseURL}${AppLink.getCart}/${UserPreferences.userId}");

      // Make the HTTP request
      var request = http.Request('GET', uri);
      request.headers.addAll(headers);

      // Await the response
      http.StreamedResponse response = await request.send();
      String result = await response.stream.bytesToString();
      var finalResponse = jsonDecode(result);

      if (finalResponse['success']) {
        checkoutsummary.clear();
        CartData.clear();
        checkoutsummary.add(finalResponse["summary"]);
        for (int i = 0; i < finalResponse["data"].length; i++) {
          CartData.add(CartProduct.fromJson(finalResponse["data"][i]));
        }
      } else {
        print(finalResponse['error']);
        CustSnackbar.showCustomSnackbar(
          context: context,
          message: finalResponse['error'],
          backgroundColor: AppColors.redPrice,
        );
      }
    } catch (error) {
      print(error);
      CustSnackbar.showCustomSnackbar(
        context: context,
        message: error.toString(),
        backgroundColor: AppColors.redPrice,
      );
    }
  }

  Future addItemsToCart(BuildContext context, {required dynamic data}) async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': '${UserPreferences.token}',
      };

      var uri = Uri.parse("${AppLink.baseURL}${AppLink.addToCart}");

      // Make the HTTP request
      var request = http.Request('POST', uri);
      request.headers.addAll(headers);

      var body = jsonEncode(data);

      request.body = body;

      // Await the response
      http.StreamedResponse response = await request.send();
      String result = await response.stream.bytesToString();
      var finalResponse = jsonDecode(result);

      if (finalResponse['success']) {
        CustSnackbar.showCustomSnackbar(
          context: context,
          message: finalResponse['message'],
          backgroundColor: Colors.green,
        );
      } else {
        CustSnackbar.showCustomSnackbar(
          context: context,
          message: finalResponse['message'],
          backgroundColor: AppColors.redPrice,
        );
      }
    } catch (error) {
      CustSnackbar.showCustomSnackbar(
        context: context,
        message: error.toString(),
        backgroundColor: AppColors.redPrice,
      );
    }
  }
}
