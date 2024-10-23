import 'package:booksica/models/allBooks.dart';
import 'package:booksica/models/subCategories.dart';
import 'package:booksica/styles/colors.dart';
import 'package:booksica/utils/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NavCard {
  //bottom navigation card
  static Widget navCard(BuildContext context, Widget child) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      height: h * .080,
      width: w * .160,
      decoration: const BoxDecoration(
          image:
              DecorationImage(image: AssetImage("assets/icons/Rectangle.png"))),
      child: child,
    );
  }

  // category cards
  static Widget categoryCard(BuildContext context, String image, String title) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          height: h * .080,
          width: w * .160,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: AppColors.appGrey),
          child: Center(
            child: Image.network(
              image,
              height: h * .040,
              width: w * .070,
            ),
          ),
        ),
        AppFonts.text(
            context, title, w * .030, FontWeight.w400, AppColors.black)
      ],
    );
  }

  // home books card

  static Widget HomeBooksMainCard(
      BuildContext context,
      String image,
      String title,
      String author,
      String mrp,
      String price,
      String rating,
      String discount) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          height: h * .250,
          width: w * .350,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade200, width: 0.8),
              borderRadius: BorderRadius.circular(w * .020),
              color: Colors.white),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: w * .020, vertical: w * .010),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: h * .150,
                        width: w * .300,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.contain,
                                image: NetworkImage(image))),
                      ),
                    ),
                    SizedBox(
                      height: h * .010,
                    ),
                    AppFonts.text(
                        context,
                        title.length > 18
                            ? "${title.substring(0, 18)}..."
                            : title,
                        w * .025,
                        FontWeight.w600,
                        AppColors.bookCardColor),
                    SizedBox(
                      height: h * .020,
                    ),
                    AppFonts.text(
                        context,
                        "By - ${author.length > 12 ? "${author.substring(0, 12)}.." : author}",
                        w * .025,
                        FontWeight.w600,
                        Colors.grey),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "₹ ${mrp}",
                              style: GoogleFonts.poppins(
                                  fontSize: w * .025,
                                  decoration: TextDecoration.lineThrough,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey),
                            ),
                            AppFonts.text(context, "₹ ${price}", w * .025,
                                FontWeight.w700, AppColors.redPrice),
                          ],
                        ),
                        AppFonts.text(context, "${rating} ⭐", w * .025,
                            FontWeight.w600, AppColors.black),
                      ],
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  height: h * .025,
                  width: w * .150,
                  decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(w * .020))),
                  child: Center(
                    child: AppFonts.text(context, "${discount}% off", w * .025,
                        FontWeight.w500, AppColors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // category Page Card

  static Widget CategoryCard(BuildContext context, SubCategories data) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      height: h * .140,
      width: w * .300,
      decoration: BoxDecoration(
          color: AppColors.appGrey,
          borderRadius: BorderRadius.circular(w * .018)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            "https://booksica.s3.ap-south-1.amazonaws.com/${data.icon}",
            height: w * .080,
            width: w * .080,
          ),
          SizedBox(
            height: h * .010,
          ),
          AppFonts.text(
              context, data.name, w * .035, FontWeight.w600, AppColors.black),
          AppFonts.text(context, "${data.books} books", w * .035,
              FontWeight.w600, Colors.grey)
        ],
      ),
    );
  }

  static Widget filterComponent(BuildContext context, Product data) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    print(data.thumbnail);
    return Container(
      height: h * .130,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          data.thumbnail == "https://example.com/sample_thumbnail.jpg"
              ? Image.asset(
                  "assets/images/default.png",
                  fit: BoxFit.cover,
                  height: h * .260,
                  width: w * .220,
                )
              : CachedNetworkImage(
                  height: h * .260,
                  width: w * .220,
                  fit: BoxFit.contain,
                  imageUrl:
                      "https://booksica.s3.ap-south-1.amazonaws.com/${data.thumbnail}",
                  placeholder: (context, url) => Image.asset(
                    "assets/images/default.png",
                    fit: BoxFit.cover,
                    height: h * .260,
                    width: w * .220,
                  ),
                  errorWidget: (context, url, error) => Image.asset(
                    "assets/images/default.png",
                    fit: BoxFit.cover,
                    height: h * .260,
                    width: w * .220,
                  ),
                ),
          SizedBox(
            width: w * .030,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppFonts.text(
                  context,
                  data.title!.toString().length > 24
                      ? "${data.title!.toString().substring(0, 24)}..."
                      : data.title!,
                  w * .040,
                  FontWeight.w500,
                  AppColors.black),
              AppFonts.text(context, "by - ${data.author['name']}", w * .035,
                  FontWeight.w500, Colors.grey),
              Row(
                children: [
                  AppFonts.text(context, "4.0", w * .035, FontWeight.w500,
                      AppColors.black),
                  SizedBox(
                    width: w * .015,
                  ),
                  RatingStars(
                    starCount: 5,
                    value: 4,
                    starSpacing: w * .010,
                    starSize: w * .030,
                    starOffColor: AppColors.appGrey,
                    maxValueVisibility: false,
                    valueLabelVisibility: false,
                    starColor: AppColors.redPrice,
                  ),
                  SizedBox(
                    width: w * .015,
                  ),
                  AppFonts.text(
                      context, "(200)", w * .035, FontWeight.w500, Colors.grey),
                ],
              ),
              AppFonts.text(context, "Paperback", w * .035, FontWeight.w500,
                  AppColors.black),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: w * .008),
                    child: AppFonts.text(context, "₹", w * .035,
                        FontWeight.w600, AppColors.black),
                  ),
                  SizedBox(
                    width: w * .005,
                  ),
                  AppFonts.text(context, data.price.toString() ?? "", w * .045,
                      FontWeight.w600, AppColors.black),
                  SizedBox(
                    width: w * .010,
                  ),
                  AppFonts.text(context, "M.R.P. ₹", w * .028, FontWeight.w600,
                      Colors.grey),
                  Text(
                    data.mrp.toString(),
                    style: GoogleFonts.poppins(
                        fontSize: w * .028,
                        decoration: TextDecoration.lineThrough,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey),
                  ),
                  AppFonts.text(context, "(${data.discount ?? ""}% off)",
                      w * .028, FontWeight.w600, Colors.grey),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
