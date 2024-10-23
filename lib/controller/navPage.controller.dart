import 'package:booksica/views/ShoppingCartPage.dart';
import 'package:booksica/views/categoryPage.dart';
import 'package:booksica/views/homePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class NavPageController extends GetxController {
  List<dynamic> pages =
      [const HomePage(), const CategoryScreen(), const ShoppingCartPage()].obs;

  RxBool countPixal = true.obs;

  RxInt pageNo = 0.obs;
}
