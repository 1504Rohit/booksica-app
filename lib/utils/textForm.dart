import 'package:booksica/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustTextForm {
  static Widget custTextFormSearch(
      String hintText,
      int maxLine,
      int maxLength,
      Widget? prefixIcon,
      Widget? suffixIcon,
      TextInputType keyBoardType,
      BuildContext context,
      Function(String) onChanged,
      TextEditingController controller,
      bool focus,
      Function(String) onSubmitted,
      VoidCallback onClicked) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return TextFormField(
        controller: controller,
        cursorHeight: h * .025,
        cursorColor: AppColors.primary,
        autofocus: focus,
        onTap: () {
          onClicked();
        },
        onChanged: onChanged,
        onFieldSubmitted: onSubmitted,
        style: GoogleFonts.poppins(
            fontSize: w * .035,
            fontWeight: FontWeight.w500,
            color: AppColors.black),
        keyboardType: keyBoardType,
        maxLines: maxLine,
        maxLength: maxLength,
        decoration: InputDecoration(
          isDense: true,
          isCollapsed: true,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          fillColor: Colors.white,
          prefixIconColor: AppColors.black,
          focusColor: Colors.grey,
          filled: true,
          counterText: "",
          // contentPadding:
          //     EdgeInsets.only(top: Mq.h * .012, bottom: Mq.h * .012),
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(
              fontSize: w * .035,
              fontWeight: FontWeight.w500,
              color: Colors.grey),
          border: InputBorder.none,
        ));
  }
}
