import 'package:booksica/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppButtons {
  static Widget loginLike(
      BuildContext context,
      VoidCallback onClicked,
      Widget widget,
      Color color,
      bool isLoading,
      double height,
      double radius) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    double W = w;
    return ElevatedButton(
        style: ButtonStyle(
            minimumSize: WidgetStateProperty.all(Size(double.infinity, height)),
            shape: WidgetStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            )),
            backgroundColor: WidgetStateProperty.all(color)),
        onPressed: () {
          onClicked();
        },
        child: isLoading
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: w * .040,
                    width: w * .040,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: AppColors.white,
                        strokeWidth: 3,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: w * .020,
                  ),
                  widget
                ],
              )
            : widget);
  }

  static Widget loginLikeWithBorder(
      BuildContext context,
      VoidCallback onClicked,
      Widget widget,
      Color color,
      bool isLoading,
      double height,
      double radius) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    double W = w;
    return ElevatedButton(
        style: ButtonStyle(
            minimumSize: WidgetStateProperty.all(Size(double.infinity, height)),
            shape: WidgetStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
                side: BorderSide(color: AppColors.appGrey, width: 1))),
            backgroundColor: WidgetStateProperty.all(color)),
        onPressed: () {
          onClicked();
        },
        child: isLoading
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: w * .040,
                    width: w * .040,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                        strokeWidth: 3,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: w * .020,
                  ),
                  widget
                ],
              )
            : widget);
  }
}
