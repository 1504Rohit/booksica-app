import 'package:booksica/styles/colors.dart';
import 'package:booksica/utils/orderStatusTracker.dart';
import 'package:booksica/utils/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:order_tracker/order_tracker.dart';

class OrderDetailsPage extends StatefulWidget {
  const OrderDetailsPage({super.key});

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
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
        title: AppFonts.text(context, "Order Details", w * .045,
            FontWeight.w500, AppColors.black),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * .040),
        child: Column(
          children: [
            Container(
              height: h * .150,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300, width: 1),
                  borderRadius: BorderRadius.circular(w * .020)),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: w * .030, vertical: h * .015),
                child: Row(
                  children: [
                    Image.asset("assets/images/book1.png"),
                    SizedBox(
                      width: w * .060,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppFonts.text(context, "Naruto, Volume 1", w * .038,
                            FontWeight.w600, AppColors.black),
                        AppFonts.text(context, "Brant Name", w * .035,
                            FontWeight.w500, Colors.black54),
                        AppFonts.text(context, "Rs. 399", w * .038,
                            FontWeight.w600, AppColors.black),
                        SizedBox(
                          height: h * .020,
                        ),
                        SizedBox(
                          width: w * .600,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppFonts.text(context, "Quantity: 1", w * .030,
                                  FontWeight.w500, Colors.black54),
                              Row(
                                children: [
                                  AppFonts.text(context, "Status :", w * .030,
                                      FontWeight.w500, Colors.black54),
                                  AppFonts.text(context, " Ordered", w * .030,
                                      FontWeight.w500, Colors.green),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: h * .020,
            ),
            Container(
              height: h * .060,
              width: w * .450,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(w * .020),
                  border: Border.all(width: 1, color: Colors.grey.shade400)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/cancel.png',
                    height: h * .030,
                    width: w * .060,
                  ),
                  SizedBox(
                    width: w * .020,
                  ),
                  AppFonts.text(context, "CANCEL ORDER", w * .035,
                      FontWeight.w500, Colors.black87)
                ],
              ),
            ),
            CustomOrderTracker(status: 0)
          ],
        ),
      ),
    );
  }
}
