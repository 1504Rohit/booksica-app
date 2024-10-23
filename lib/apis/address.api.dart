import 'dart:convert';
import 'dart:ffi';

import 'package:booksica/config/ApiLink.dart';
import 'package:booksica/config/userPreference.dart';
import 'package:booksica/models/address.dart';
import 'package:booksica/styles/colors.dart';
import 'package:booksica/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AddressApi extends GetxController {
  RxBool updateLoading = false.obs;
  RxBool addAddressLoading = false.obs;
  RxList<Address> addressData = RxList();
  Rx<Address> defaultAddress = Address.fromJson({
    "_id": "",
    "name": "",
    "address": "",
    "area": "",
    "pincode": 00000,
    "city": "",
    "state": "",
    "phone": 0000000000,
    "landmark": "",
    "defaultAddress": false,
    "disabled": false,
    "userId": "",
    "__v": 0
  }).obs;
  Future getAllAddress(BuildContext context) async {
    try {
      print("Api Call");

      var headers = {
        'Authorization': 'Bearer ${UserPreferences.token}',
      };

      var uri = Uri.parse(
          "${AppLink.baseURL}${AppLink.getAllAddress}/${UserPreferences.userId}");

      // Make the HTTP request
      var request = http.Request('GET', uri);
      request.headers.addAll(headers);

      // Await the response
      http.StreamedResponse response = await request.send();
      String result = await response.stream.bytesToString();
      var finalResponse = jsonDecode(result);

      if (finalResponse['success']) {
        addressData.clear();
        for (int i = 0; i < finalResponse["data"].length; i++) {
          if (finalResponse["data"][i]['defaultAddress']) {
            defaultAddress.value = Address.fromJson(finalResponse["data"][i]);
          }
          addressData.add(Address.fromJson(finalResponse["data"][i]));
        }
        print(addressData);
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

  Future updateAddress(BuildContext context,
      {required String id, required dynamic data}) async {
    try {
      print(data);
      updateLoading.value = true;
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': '${UserPreferences.token}',
      };

      var uri = Uri.parse(
          "${AppLink.baseURL}${AppLink.updateAddress}/${UserPreferences.userId}/${id}");

      // Make the HTTP request
      var request = http.Request('PUT', uri);
      request.headers.addAll(headers);

      var body = jsonEncode(data);

      request.body = body;

      // Await the response
      http.StreamedResponse response = await request.send();
      String result = await response.stream.bytesToString();
      var finalResponse = jsonDecode(result);

      if (finalResponse['success']) {
        updateLoading.value = false;
        CustSnackbar.showCustomSnackbar(
          context: context,
          message: finalResponse['message'],
          backgroundColor: Colors.green,
        );
      } else {
        updateLoading.value = false;
        CustSnackbar.showCustomSnackbar(
          context: context,
          message: finalResponse['message'],
          backgroundColor: AppColors.redPrice,
        );
      }
    } catch (error) {
      updateLoading.value = false;
      CustSnackbar.showCustomSnackbar(
        context: context,
        message: error.toString(),
        backgroundColor: AppColors.redPrice,
      );
    }
  }

  Future addAddress(BuildContext context, {required dynamic data}) async {
    try {
      addAddressLoading.value = true;

      var headers = {
        'Content-Type': 'application/json',
        'Authorization': '${UserPreferences.token}',
      };

      var uri = Uri.parse(
          "${AppLink.baseURL}${AppLink.updateAddress}/${UserPreferences.userId}");

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
        addAddressLoading.value = false;
        CustSnackbar.showCustomSnackbar(
          context: context,
          message: finalResponse['message'],
          backgroundColor: Colors.green,
        );
      } else {
        addAddressLoading.value = false;
        CustSnackbar.showCustomSnackbar(
          context: context,
          message: finalResponse['message'],
          backgroundColor: AppColors.redPrice,
        );
      }
    } catch (error) {
      addAddressLoading.value = false;
      CustSnackbar.showCustomSnackbar(
        context: context,
        message: error.toString(),
        backgroundColor: AppColors.redPrice,
      );
    }
  }
}
