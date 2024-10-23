import 'package:booksica/apis/Cart.api.dart';
import 'package:booksica/apis/address.api.dart';
import 'package:booksica/config/userPreference.dart';
import 'package:booksica/controller/ShoppingCart.controller.dart';
import 'package:booksica/controller/navPage.controller.dart';
import 'package:booksica/models/address.dart';
import 'package:booksica/styles/colors.dart';
import 'package:booksica/utils/AppButtons.dart';
import 'package:booksica/utils/text.dart';
import 'package:booksica/views/AddressFormPage.dart';
import 'package:booksica/views/addressPage.dart';
import 'package:booksica/views/paymentPage..dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({super.key});

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  NavPageController pageController = Get.put(NavPageController());

  ShoppingCartController shoppingCartController =
      Get.put(ShoppingCartController());

  CartApis cartApis = Get.put(CartApis());

  AddressApi addressApi = Get.put(AddressApi());

  Address data = Address.fromJson({
    "_id": "",
    "name": "Rohit",
    "address": "33, kandoya gali shree ram bhavan",
    "area": "kila",
    "pincode": 458001,
    "city": "Mandsaur",
    "state": "Madhya Pradesh",
    "phone": 8770764651,
    "landmark": "sitla maata mandir",
    "defaultAddress": true,
    "disabled": false,
    "userId": "65c8e502d4b66a0499b99701",
    "__v": 0
  });

  @override
  void initState() {
    // TODO: implement initState
    cartApis.getAllCartItems(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          centerTitle: false,
          forceMaterialTransparency: true,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppColors.primary,
            statusBarIconBrightness: Brightness.light,
          ),
          backgroundColor: AppColors.white,
          leading: InkWell(
            onTap: () {
              if (pageController.pageNo.value > 1) {
                pageController.countPixal.value = true;
                pageController.pageNo.value = 1;
              } else {
                Navigator.pop(context);
              }
            },
            child: Padding(
              padding: EdgeInsets.all(w * .045),
              child: Image.asset(
                "assets/icons/arrowleft.png",
              ),
            ),
          ),
          title: AppFonts.text(context, "Shopping Cart", w * .045,
              FontWeight.w500, AppColors.black),
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: w * .040),
            child: Obx(() => SingleChildScrollView(
                  child: Column(
                    children: [
                      cartApis.CartData.isEmpty
                          ? Center(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: h * .120,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(w * .070),
                                    child: SizedBox(
                                      child: Image.asset(
                                          "assets/icons/noCart.png"),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : addressApi.addressData.length == 0
                              ? SizedBox()
                              : Container(
                                  height: h * .080,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey.shade300,
                                          width: 2),
                                      borderRadius:
                                          BorderRadius.circular(w * .010)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: w * .020,
                                        vertical: h * .015),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Obx(
                                          () => Container(
                                              color: Colors.white,
                                              width: w * .700,
                                              child: Text(
                                                "${addressApi.defaultAddress.value.address} ${addressApi.defaultAddress.value.area} ${addressApi.defaultAddress.value.city} ${addressApi.defaultAddress.value.pincode}",
                                                textAlign: TextAlign.left,
                                                style: GoogleFonts.poppins(
                                                    fontSize: w * .032,
                                                    fontWeight: FontWeight.w500,
                                                    color:
                                                        Colors.grey.shade500),
                                              )),
                                        ),
                                        IntrinsicWidth(
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          AddAddressPage()));
                                            },
                                            child: Container(
                                              height: h * .030,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: AppColors.primary,
                                                      width: 2),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          w * .008)),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: w * .020),
                                                child: Center(
                                                  child: AppFonts.text(
                                                      context,
                                                      "Change",
                                                      w * .028,
                                                      FontWeight.w500,
                                                      AppColors.primary),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                      SizedBox(
                        height: h * .010,
                      ),
                      Obx(
                        () => ListView.builder(
                            itemCount: cartApis.CartData.length,
                            scrollDirection: Axis.vertical,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, i) {
                              shoppingCartController.bookQuantity
                                  .add(cartApis.CartData[i].quantity);
                              return Padding(
                                padding:
                                    EdgeInsets.symmetric(vertical: h * .010),
                                child: Container(
                                  height: h * .150,
                                  width: w,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: h * .150,
                                        width: w * .240,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.contain,
                                                image: NetworkImage(
                                                    "https://booksica.s3.ap-south-1.amazonaws.com/${cartApis.CartData[i].product.thumbnail}"))),
                                      ),
                                      SizedBox(
                                        width: w * .040,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AppFonts.text(
                                              context,
                                              cartApis.CartData[i].product.title
                                                          .toString()
                                                          .length >
                                                      24
                                                  ? '${cartApis.CartData[i].product.title.toString().substring(0, 25)}...'
                                                  : cartApis
                                                      .CartData[i].product.title
                                                      .toString(),
                                              w * .040,
                                              FontWeight.w500,
                                              Colors.black54),
                                          Row(
                                            children: [
                                              AppFonts.text(
                                                  context,
                                                  "by - ${cartApis.CartData[i].product.author.name}",
                                                  w * .028,
                                                  FontWeight.w500,
                                                  Colors.grey.shade400),
                                              AppFonts.text(
                                                  context,
                                                  "   ₹ ${cartApis.CartData[i].product.price}",
                                                  w * .035,
                                                  FontWeight.w500,
                                                  AppColors.primary),
                                            ],
                                          ),
                                          AppFonts.text(
                                              context,
                                              cartApis.CartData[i].product
                                                  .subCategory.name,
                                              w * .028,
                                              FontWeight.w500,
                                              Colors.black54),
                                          SizedBox(
                                            height: h * .010,
                                          ),
                                          Obx(() => Row(
                                                children: [
                                                  InkWell(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            w * .025),
                                                    onTap: () {
                                                      if (shoppingCartController
                                                              .bookQuantity[i] >
                                                          0) {
                                                        cartApis.addItemsToCart(
                                                            context,
                                                            data: {
                                                              "product":
                                                                  cartApis
                                                                      .CartData[
                                                                          i]
                                                                      .id,
                                                              "qty":
                                                                  "${shoppingCartController.bookQuantity[i]--}",
                                                              "update": true,
                                                              "userId":
                                                                  UserPreferences
                                                                      .userId
                                                            }).then((Value) {
                                                          cartApis
                                                              .getAllCartItems(
                                                                  context);
                                                        });
                                                      }
                                                    },
                                                    child: Container(
                                                      height: h * .040,
                                                      width: w * .090,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: Colors.grey
                                                                  .shade400,
                                                              width: 1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(w *
                                                                      .025)),
                                                      child: Center(
                                                        child: shoppingCartController
                                                                        .bookQuantity[
                                                                    i] >
                                                                1
                                                            ? AppFonts.text(
                                                                context,
                                                                "-",
                                                                w * .058,
                                                                FontWeight.w500,
                                                                Colors.black54)
                                                            : Image.asset(
                                                                "assets/icons/delete.png",
                                                                height:
                                                                    h * .025,
                                                                width: w * .060,
                                                              ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                w * .040),
                                                    child: AppFonts.text(
                                                        context,
                                                        shoppingCartController
                                                            .bookQuantity[i]
                                                            .toString(),
                                                        w * .040,
                                                        FontWeight.w500,
                                                        Colors.black54),
                                                  ),
                                                  InkWell(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            w * .025),
                                                    onTap: () {
                                                      cartApis.addItemsToCart(
                                                          context,
                                                          data: {
                                                            "product": cartApis
                                                                .CartData[i].id,
                                                            "qty":
                                                                "${shoppingCartController.bookQuantity[i]++}",
                                                            "update": true,
                                                            "userId":
                                                                UserPreferences
                                                                    .userId
                                                          }).then((Value) {
                                                        cartApis
                                                            .getAllCartItems(
                                                                context);
                                                      });
                                                    },
                                                    child: Container(
                                                      height: h * .040,
                                                      width: w * .090,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: Colors.grey
                                                                  .shade400,
                                                              width: 1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(w *
                                                                      .025)),
                                                      child: Center(
                                                        child: AppFonts.text(
                                                            context,
                                                            "+",
                                                            w * .058,
                                                            FontWeight.w500,
                                                            Colors.black54),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                      SizedBox(
                        height: h * .100,
                      ),
                      Obx(
                        () => cartApis.CartData.isEmpty
                            ? SizedBox()
                            : Stack(
                                children: [
                                  Image.asset(
                                    "assets/images/checkOutBg.png",
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: w * .040,
                                        vertical: h * .020),
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.center,
                                          child: AppFonts.text(
                                              context,
                                              "Checkout Summary",
                                              w * .038,
                                              FontWeight.w600,
                                              AppColors.white),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: h * .020),
                                          child: const DottedLine(
                                            dashColor: Colors.white,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: h * .020),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              AppFonts.text(
                                                  context,
                                                  "Subtotal",
                                                  w * .038,
                                                  FontWeight.w500,
                                                  AppColors.white),
                                              AppFonts.text(
                                                  context,
                                                  "₹ ${cartApis.checkoutsummary[0]['subtotal'].toString()}",
                                                  w * .038,
                                                  FontWeight.w500,
                                                  AppColors.white),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: h * .020),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              AppFonts.text(
                                                  context,
                                                  "Discount",
                                                  w * .038,
                                                  FontWeight.w500,
                                                  AppColors.white),
                                              AppFonts.text(
                                                  context,
                                                  "-₹ ${cartApis.checkoutsummary[0]['totalDiscount'].toString()}",
                                                  w * .038,
                                                  FontWeight.w500,
                                                  AppColors.white),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: h * .020),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              AppFonts.text(
                                                  context,
                                                  "Shipping Charge",
                                                  w * .038,
                                                  FontWeight.w500,
                                                  AppColors.white),
                                              AppFonts.text(
                                                  context,
                                                  "+₹ ${cartApis.checkoutsummary[0]['shippingCharge'].toString()}",
                                                  w * .038,
                                                  FontWeight.w500,
                                                  AppColors.white),
                                            ],
                                          ),
                                        ),
                                        const Divider(
                                          color: Colors.white,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: h * .020),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              AppFonts.text(
                                                  context,
                                                  "Total Payback Amount",
                                                  w * .038,
                                                  FontWeight.w500,
                                                  AppColors.white),
                                              AppFonts.text(
                                                  context,
                                                  "₹ ${cartApis.checkoutsummary[0]['netPayableAmount'].toString()}",
                                                  w * .038,
                                                  FontWeight.w500,
                                                  AppColors.white),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                      ),
                      SizedBox(
                        height: h * .100,
                      ),
                    ],
                  ),
                ))),
        bottomNavigationBar: cartApis.CartData.isEmpty
            ? SizedBox()
            : Obx(
                () => addressApi.addressData.length == 0
                    ? Container(
                        height: h * .083,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: w * .040),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: h * .010,
                              ),
                              AppButtons.loginLike(context, () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            AddressFormPage(data: data)));
                              },
                                  Center(
                                    child: AppFonts.text(
                                        context,
                                        "Add Address",
                                        w * .038,
                                        FontWeight.w600,
                                        AppColors.white),
                                  ),
                                  AppColors.primary,
                                  false,
                                  h * .063,
                                  w * .020),
                              SizedBox(
                                height: h * .010,
                              ),
                            ],
                          ),
                        ),
                      )
                    : Container(
                        height: h * .083,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: w * .040),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: h * .010,
                              ),
                              AppButtons.loginLike(context, () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => PaymentPage()));
                              },
                                  Center(
                                    child: AppFonts.text(
                                        context,
                                        "Place Order",
                                        w * .038,
                                        FontWeight.w600,
                                        AppColors.white),
                                  ),
                                  AppColors.primary,
                                  false,
                                  h * .063,
                                  w * .020),
                              SizedBox(
                                height: h * .010,
                              ),
                            ],
                          ),
                        ),
                      ),
              ));
  }
}
