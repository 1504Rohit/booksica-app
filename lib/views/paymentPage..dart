import 'package:booksica/controller/paymentController.dart';
import 'package:booksica/styles/colors.dart';
import 'package:booksica/utils/AppButtons.dart';
import 'package:booksica/utils/text.dart';
import 'package:booksica/views/orderPlacedPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  PaymentController paymentController = Get.put(PaymentController());
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        centerTitle: true,
        forceMaterialTransparency: true,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.primary,
          statusBarIconBrightness: Brightness.light,
        ),
        backgroundColor: AppColors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: EdgeInsets.all(w * .045),
            child: Image.asset(
              "assets/icons/arrowleft.png",
            ),
          ),
        ),
        title: AppFonts.text(
            context, "Payments", w * .045, FontWeight.w500, AppColors.black),
      ),
      body: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: w * .040, vertical: h * .020),
          child: Obx(
            () => Column(
              children: [
                InkWell(
                  onTap: () {
                    paymentController.no.value = 0;
                  },
                  child: Row(
                    children: [
                      Container(
                        height: h * .030,
                        width: w * .060,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            shape: BoxShape.circle),
                        child: paymentController.no.value == 0
                            ? Center(
                                child: Container(
                                  height: h * .020,
                                  width: w * .040,
                                  decoration: BoxDecoration(
                                      color: AppColors.primary,
                                      shape: BoxShape.circle),
                                ),
                              )
                            : SizedBox(),
                      ),
                      SizedBox(
                        width: w * .040,
                      ),
                      AppFonts.text(context, "UPI / Netbanking", w * .035,
                          FontWeight.w500, Colors.black)
                    ],
                  ),
                ),
                SizedBox(
                  height: h * .040,
                ),
                InkWell(
                  onTap: () {
                    paymentController.no.value = 1;
                  },
                  child: Row(
                    children: [
                      Container(
                        height: h * .030,
                        width: w * .060,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            shape: BoxShape.circle),
                        child: paymentController.no.value == 1
                            ? Center(
                                child: Container(
                                  height: h * .020,
                                  width: w * .040,
                                  decoration: BoxDecoration(
                                      color: AppColors.primary,
                                      shape: BoxShape.circle),
                                ),
                              )
                            : SizedBox(),
                      ),
                      SizedBox(
                        width: w * .040,
                      ),
                      AppFonts.text(context, "Cash on Delivery", w * .035,
                          FontWeight.w500, Colors.black)
                    ],
                  ),
                )
              ],
            ),
          )),
      bottomNavigationBar: Container(
        height: h * .080,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: w * .040),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppFonts.text(context, "Rs. 453", w * .050, FontWeight.w500,
                  AppColors.black),
              SizedBox(
                width: w * .450,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: h * .010),
                  child: AppButtons.loginLike(context, () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => OrderPlacedPage()));
                  },
                      Center(
                        child: AppFonts.text(context, "Continue", w * .038,
                            FontWeight.w400, AppColors.white),
                      ),
                      AppColors.primary,
                      false,
                      h * .038,
                      w * .100),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
