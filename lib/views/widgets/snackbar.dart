import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class ShowSnackbar {
  static SnackbarController show(title, msg, status) {
    return Get.snackbar(
      "Demo Title",
      "Demo snakber massage",
      titleText: Text(
        title,
        style: GoogleFonts.raleway(
          fontSize: 14.sp,
          color: status == "warning" ? Colors.orange.shade700 : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      messageText: Text(
        msg,
        style: GoogleFonts.openSans(
          fontSize: 11.sp,
          color: status == "warning" ? Colors.orange.shade700 : Colors.black,
        ),
      ),
      icon: status == "warning"
          ? Padding(
              padding: EdgeInsets.all(20.sp),
              child: Icon(
                Icons.warning,
                size: 12.w,
                color: Colors.orange.shade700,
              ),
            )
          : status == "success"
              ? Padding(
                  padding: EdgeInsets.all(20.sp),
                  child: Icon(
                    Icons.done,
                    size: 12.w,
                    color: Colors.green,
                  ),
                )
              : Padding(
                  padding: EdgeInsets.all(20.sp),
                  child: Icon(
                    Icons.done,
                    size: 12.w,
                  ),
                ),
      snackPosition: SnackPosition.TOP,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      colorText: status == "warning" ? Colors.orange.shade700 : Colors.black,
      margin: EdgeInsets.only(left: 5.w, right: 5.w, top: 16.h),
      backgroundColor: Colors.white.withOpacity(0.8),
      overlayBlur: 0.8,
    );
  }
}
