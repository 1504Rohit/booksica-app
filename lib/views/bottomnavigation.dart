import 'package:booksica/apis/Cart.api.dart';
import 'package:booksica/apis/address.api.dart';
import 'package:booksica/config/mediaquery.dart';
import 'package:booksica/controller/navPage.controller.dart';
import 'package:booksica/styles/colors.dart';
import 'package:booksica/utils/Cards.dart';
import 'package:booksica/utils/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart'; // Ensure you have the correct version of this package

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  NavPageController pageController = Get.put(NavPageController());
  CartApis cartApis = Get.put(CartApis());
  AddressApi addressApi = Get.put(AddressApi());
  @override
  void initState() {
    cartApis.getAllCartItems(context);
    addressApi.getAllAddress(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        // navigation bar color
        statusBarColor: AppColors.primary, // status bar color
        statusBarIconBrightness: Brightness.light));
    return Scaffold(
      body: Stack(
        children: [
          Obx(() => pageController.pages[pageController.pageNo.value]),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
                padding: EdgeInsets.all(w * .020),
                child: Obx(
                  () => AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    height: pageController.countPixal.value ? h * .10 : 0,
                    width: w,
                    decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(w * .060)),
                    child: pageController.countPixal.value
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {
                                  pageController.pageNo.value = 0;
                                },
                                child: NavCard.navCard(
                                    context,
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          "assets/icons/home.png",
                                          color:
                                              pageController.pageNo.value == 0
                                                  ? AppColors.primary
                                                  : Colors.grey,
                                          height: w * .060,
                                          width: w * .060,
                                        ),
                                        pageController.pageNo.value == 0
                                            ? AppFonts.text(
                                                context,
                                                "Home",
                                                w * .030,
                                                FontWeight.w500,
                                                AppColors.primary)
                                            : SizedBox()
                                      ],
                                    )),
                              ),
                              InkWell(
                                onTap: () {
                                  pageController.pageNo.value = 1;
                                },
                                child: NavCard.navCard(
                                    context,
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          "assets/icons/category.png",
                                          color:
                                              pageController.pageNo.value == 1
                                                  ? AppColors.primary
                                                  : Colors.grey,
                                          height: w * .060,
                                          width: w * .060,
                                        ),
                                        pageController.pageNo.value == 1
                                            ? AppFonts.text(
                                                context,
                                                "Category",
                                                w * .030,
                                                FontWeight.w500,
                                                AppColors.primary)
                                            : SizedBox()
                                      ],
                                    )),
                              ),
                              InkWell(
                                onTap: () {
                                  pageController.pageNo.value = 2;
                                  pageController.countPixal.value = false;
                                },
                                child: NavCard.navCard(
                                    context,
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          "assets/icons/bottomCart.png",
                                          color:
                                              pageController.pageNo.value == 2
                                                  ? AppColors.primary
                                                  : Colors.grey,
                                          height: w * .060,
                                          width: w * .060,
                                        ),
                                        pageController.pageNo.value == 2
                                            ? AppFonts.text(
                                                context,
                                                "Cart",
                                                w * .030,
                                                FontWeight.w500,
                                                AppColors.primary)
                                            : SizedBox()
                                      ],
                                    )),
                              ),
                            ],
                          )
                        : SizedBox(),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
