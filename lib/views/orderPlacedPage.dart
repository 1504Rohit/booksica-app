import 'package:booksica/styles/colors.dart';
import 'package:booksica/utils/AppButtons.dart';
import 'package:booksica/utils/text.dart';
import 'package:booksica/views/OrderDetailsPage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OrderPlacedPage extends StatefulWidget {
  const OrderPlacedPage({super.key});

  @override
  State<OrderPlacedPage> createState() => _OrderPlacedPageState();
}

class _OrderPlacedPageState extends State<OrderPlacedPage> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
          backgroundColor: AppColors.primary,
          leading: Padding(
            padding: EdgeInsets.only(left: w * .030),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: CircleAvatar(
                backgroundColor: Colors.grey.shade200,
                radius: w * .050,
                child: Padding(
                  padding: EdgeInsets.all(w * .025),
                  child: Image.asset('assets/icons/arrowLeft2.png'),
                ),
              ),
            ),
          )),
      body: Column(
        children: [
          SizedBox(
            height: h * .040,
          ),
          Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: h * .250,
                  ),
                  Align(
                    child: AppFonts.text(
                        context,
                        "That was too easy!",
                        w * .035,
                        FontWeight.w600,
                        const Color.fromARGB(255, 70, 168, 249)),
                  ),
                  SizedBox(
                    height: h * .010,
                  ),
                  AppFonts.text(
                    context,
                    "Congrats!",
                    w * .055,
                    FontWeight.w600,
                    Colors.white,
                  ),
                  SizedBox(
                    height: h * .010,
                  ),
                  AppFonts.text(
                    context,
                    "Your Order is Placed.",
                    w * .055,
                    FontWeight.w600,
                    Colors.white,
                  ),
                  SizedBox(
                    height: h * .015,
                  ),
                  AppFonts.text(
                      context,
                      "Delivery Estimated time between 7-8 days",
                      w * .035,
                      FontWeight.w600,
                      const Color.fromARGB(255, 70, 168, 249)),
                ],
              ),
              Lottie.asset('assets/lottie/success.json'),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: h * .200,
                  width: w * .400,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 12),
                      color: AppColors.white,
                      shape: BoxShape.circle),
                  child: Lottie.asset('assets/lottie/celebration.json',
                      height: h * .280, width: w * .460, fit: BoxFit.cover),
                ),
              ),
            ],
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: h * .170,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: w * .040),
          child: Column(
            children: [
              AppButtons.loginLike(
                  context,
                  () {},
                  Center(
                    child: AppFonts.text(context, "Back To Home", w * .040,
                        FontWeight.w600, AppColors.black),
                  ),
                  Colors.white,
                  false,
                  h * .066,
                  w * .025),
              SizedBox(
                height: h * .010,
              ),
              AppButtons.loginLike(context, () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => OrderDetailsPage()));
              },
                  Center(
                    child: AppFonts.text(context, "Go to Order", w * .040,
                        FontWeight.w600, AppColors.white),
                  ),
                  Colors.black,
                  false,
                  h * .066,
                  w * .025)
            ],
          ),
        ),
      ),
    );
  }
}
