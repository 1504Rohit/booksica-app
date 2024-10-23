import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetController extends GetxController {
  RxInt no = 0.obs;
  RxInt authors = 0.obs;
  RxInt no1 = 0.obs;
  RxInt authors1 = 0.obs;
  Rx<String> minPrice = "".obs;
  Rx<String> maxPrice = "".obs;
}
