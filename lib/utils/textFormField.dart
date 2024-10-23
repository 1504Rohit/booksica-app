import 'package:booksica/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomFormField {
  static Widget custTextFormSearch(
      BuildContext context,
      String hintText,
      int maxLine,
      int maxLength,
      Widget? prefixIcon,
      Widget? suffixIcon,
      TextInputType keyBoardType,
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
          color: AppColors.primary),
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
          focusColor: AppColors.appGrey,
          filled: true,
          counterText: "",
          contentPadding:
              EdgeInsets.only(top: h * .018, bottom: h * .018, left: w * .020),
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(
              fontSize: w * .035,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade500),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(w * .020),
              borderSide: BorderSide(width: 1, color: AppColors.appGrey)),
          border: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: AppColors.appGrey),
              borderRadius: BorderRadius.circular(w * .020))),
    );
  }

  // address form
  static Widget custTextFormAddress(
      BuildContext context,
      String hintText,
      int maxLine,
      int maxLength,
      Widget? prefixIcon,
      Widget? suffixIcon,
      TextInputType keyBoardType,
      Function(String) onChanged,
      TextEditingController controller,
      String? Function(String?)? validator,
      bool focus,
      Function(String) onSubmitted,
      VoidCallback onClicked) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return TextFormField(
      controller: controller,
      cursorHeight: h * .025,
      cursorColor: AppColors.primary,
      validator: validator,
      autofocus: focus,
      onTap: () {
        onClicked();
      },
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      style: GoogleFonts.poppins(
          fontSize: w * .035, fontWeight: FontWeight.w500, color: Colors.black),
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
          focusColor: AppColors.appGrey,
          filled: true,
          counterText: "",
          contentPadding:
              EdgeInsets.only(top: h * .018, bottom: h * .018, left: w * .020),
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(
              fontSize: w * .035,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade500),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(w * .010),
              borderSide: BorderSide(width: 1, color: Colors.grey.shade500)),
          border: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.grey.shade500),
              borderRadius: BorderRadius.circular(w * .010))),
    );
  }
}
