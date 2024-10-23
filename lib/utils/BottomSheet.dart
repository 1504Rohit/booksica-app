import 'dart:math';

import 'package:booksica/apis/getAllBooksApi.dart';
import 'package:booksica/apis/homeApi.api.dart';
import 'package:booksica/controller/bottomSheet.controller.dart';
import 'package:booksica/controller/filterPage.controller.dart';
import 'package:booksica/styles/colors.dart';
import 'package:booksica/utils/AppButtons.dart';
import 'package:booksica/utils/snackbar.dart';
import 'package:booksica/utils/text.dart';
import 'package:booksica/utils/textFormField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustBottomSheet {
  static Future<void> bottomSheet(BuildContext context) {
    HomeApi homeApi = Get.put(HomeApi());
    BottomSheetController bottomSheetController =
        Get.put(BottomSheetController());
    FilterController filterController = Get.put(FilterController());
    GetAllBooksApi getAllBooksApi = Get.put(GetAllBooksApi());
    TextEditingController minPrice = TextEditingController();
    TextEditingController maxPrice = TextEditingController();
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    List<String> sort = [
      'Popularity',
      'Newest',
      'Most Expensive',
      'Exam Books',
      'Novels'
    ];

    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled:
          true, // Allows the bottom sheet to resize when the keyboard opens
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context)
                  .viewInsets
                  .bottom), // Adjusts for the keyboard
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(w * .030),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: w * .040, vertical: h * .020),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        AppFonts.text(context, "Filter", w * .048,
                            FontWeight.w600, AppColors.black),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: h * .040,
                            width: w * .090,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(w * .014),
                              color: AppColors.appGrey,
                            ),
                            child: Center(
                              child: Image.asset('assets/icons/cross.png',
                                  height: h * .020, width: w * .040),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: h * .010),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * .040),
                    child: AppFonts.text(context, "Authors", w * .040,
                        FontWeight.w500, Colors.black54),
                  ),
                  SizedBox(height: h * .010),
                  Container(
                    height: h * .030,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: w * .040),
                      itemCount: homeApi.data[0].allAuthors.length,
                      itemBuilder: (context, i) {
                        return Padding(
                          padding: i == homeApi.data[0].allAuthors.length - 1
                              ? const EdgeInsets.only(right: 0)
                              : EdgeInsets.only(right: w * .020),
                          child: Obx(
                            () => InkWell(
                              onTap: () {
                                bottomSheetController.authors1.value = i + 1;
                              },
                              child: Container(
                                height: h * .030,
                                decoration: BoxDecoration(
                                  color: bottomSheetController.authors1.value ==
                                          i + 1
                                      ? AppColors.primary
                                      : AppColors.appGrey,
                                  borderRadius: BorderRadius.circular(w * .040),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: w * .040),
                                  child: Center(
                                    child: AppFonts.text(
                                      context,
                                      homeApi.data[0].allAuthors[i].name,
                                      w * .030,
                                      FontWeight.w500,
                                      bottomSheetController.authors1.value ==
                                              i + 1
                                          ? AppColors.white
                                          : Colors.black54,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: h * .030),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * .040),
                    child: AppFonts.text(context, "Sort By", w * .040,
                        FontWeight.w500, Colors.black54),
                  ),
                  SizedBox(height: h * .010),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * .040),
                    child: Wrap(
                      spacing: h * .010,
                      runSpacing: h * .015,
                      children: List.generate(sort.length, (i) {
                        return Obx(
                          () => IntrinsicWidth(
                            child: InkWell(
                              onTap: () {
                                bottomSheetController.no1.value = i + 1;
                              },
                              child: Container(
                                height: h * .050,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(w * .020),
                                  border: Border.all(
                                      color: AppColors.appGrey, width: 1),
                                  color:
                                      bottomSheetController.no1.value == i + 1
                                          ? AppColors.primary
                                          : AppColors.white,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: w * .040),
                                  child: Center(
                                    child: AppFonts.text(
                                      context,
                                      sort[i],
                                      w * .030,
                                      FontWeight.w600,
                                      bottomSheetController.no1.value == i + 1
                                          ? AppColors.white
                                          : Colors.black54,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  SizedBox(height: h * .030),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * .040),
                    child: AppFonts.text(context, "Price Range", w * .040,
                        FontWeight.w500, Colors.black54),
                  ),
                  SizedBox(height: h * .010),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * .040),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: w / 2.3,
                          child: CustomFormField.custTextFormSearch(
                            context,
                            'Min Price',
                            1,
                            100,
                            null,
                            null,
                            TextInputType.number,
                            (value) {},
                            minPrice,
                            false,
                            (value) {},
                            () {},
                          ),
                        ),
                        SizedBox(
                          width: w / 2.3,
                          child: CustomFormField.custTextFormSearch(
                            context,
                            'Max Price',
                            1,
                            100,
                            null,
                            null,
                            TextInputType.number,
                            (value) {},
                            maxPrice,
                            false,
                            (value) {},
                            () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: h * .020),
                  Obx(
                    () => Padding(
                      padding: EdgeInsets.symmetric(horizontal: w * .040),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: w / 2.3,
                            child: AppButtons.loginLikeWithBorder(
                              context,
                              () {
                                bottomSheetController.authors1.value = 0;
                                bottomSheetController.authors.value = 0;
                                bottomSheetController.no.value = 0;
                                filterController.pageNo.value = -1;
                                maxPrice.clear();
                                minPrice.clear();
                                bottomSheetController.maxPrice.value = "";
                                bottomSheetController.minPrice.value = "";
                                Navigator.pop(context);
                                getAllBooksApi
                                    .getAllBooks(context)
                                    .then((Value) {});
                                // Navigator.pop(context);
                              },
                              Center(
                                child: AppFonts.text(
                                  context,
                                  "Reset Filter",
                                  w * .038,
                                  FontWeight.w600,
                                  Colors.grey.shade500,
                                ),
                              ),
                              AppColors.white,
                              false,
                              h * .060,
                              w * .020,
                            ),
                          ),
                          SizedBox(
                            width: w / 2.3,
                            child: AppButtons.loginLike(
                              context,
                              () {
                                if (bottomSheetController.authors1.value != 0 &&
                                    maxPrice.text.toString().isNotEmpty &&
                                    minPrice.text.toString().isNotEmpty) {
                                  getAllBooksApi
                                      .getAllBooks(context,
                                          author: homeApi
                                              .data[0]
                                              .allAuthors[bottomSheetController
                                                      .authors1.value -
                                                  1]
                                              .id,
                                          maxPrice: maxPrice.text.toString(),
                                          minPrice: minPrice.text.toString())
                                      .then((Value) {
                                    Navigator.pop(context);
                                  });
                                } else if (maxPrice.text
                                        .toString()
                                        .isNotEmpty &&
                                    minPrice.text.toString().isNotEmpty) {
                                  if (maxPrice.text.toString().isEmpty ||
                                      minPrice.text.toString().isEmpty) {
                                    CustSnackbar.showCustomSnackbar(
                                        context: context,
                                        message:
                                            "Please Provide Max and Min Price Range !",
                                        backgroundColor: AppColors.redPrice);
                                  } else {
                                    getAllBooksApi
                                        .getAllBooks(context,
                                            maxPrice: maxPrice.text.toString(),
                                            minPrice: minPrice.text.toString())
                                        .then((Value) {
                                      Navigator.pop(context);
                                    });
                                  }
                                } else if (bottomSheetController
                                        .authors1.value !=
                                    0) {
                                  getAllBooksApi
                                      .getAllBooks(context,
                                          author: homeApi
                                              .data[0]
                                              .allAuthors[bottomSheetController
                                                      .authors1.value -
                                                  1]
                                              .id)
                                      .then((Value) {
                                    Navigator.pop(context);
                                  });
                                }
                              },
                              Center(
                                child: AppFonts.text(
                                  context,
                                  "Apply Filter",
                                  w * .038,
                                  FontWeight.w600,
                                  Colors.white,
                                ),
                              ),
                              AppColors.primary,
                              getAllBooksApi.isLoading.value,
                              h * .060,
                              w * .020,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: h * .020),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
