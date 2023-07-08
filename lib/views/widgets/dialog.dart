import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../init/contractors.dart';

// void customDialog() {
//   Get.dialog(

//   );
// }

class ShowDialog extends StatelessWidget {
  ShowDialog({
    Key? key,
    this.title,
    this.bodyText,
    this.bodyAlign,
    this.submitText,
    this.submitFun,
    this.cancelFun,
  }) : super(key: key);

  final String? title;
  final String? bodyText;
  final Alignment? bodyAlign;
  final String? submitText;
  final Function()? submitFun;
  final Function()? cancelFun;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 100.w,
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.all(20.sp),
        decoration: BoxDecoration(
          color: Theme.of(context).dialogBackgroundColor,
          borderRadius: BorderRadius.circular(10.sp),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100.w,
              padding: EdgeInsets.symmetric(vertical: 15.sp, horizontal: 10.sp),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey)),
              ),
              child: Text(
                title ?? "Dialog Title",
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(minHeight: 20.h),
              child: Container(
                width: 100.w,
                padding: EdgeInsets.all(15.sp),
                alignment: bodyAlign ?? Alignment.topLeft,
                decoration: BoxDecoration(
                  color: Theme.of(context).dialogTheme.backgroundColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(70.sp),
                    // bottomLeft: Radius.circular(50.sp),
                  ),
                ),
                child: Text(
                  bodyText ?? "Please put some text",
                  style: GoogleFonts.openSans(),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(10.sp),
              decoration: BoxDecoration(
                color: Theme.of(context).dialogTheme.backgroundColor,
                border: Border(top: BorderSide(color: Colors.grey)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (submitFun != null)
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo[900],
                      ),
                      onPressed: submitFun,
                      child: Text(submitText ?? "Confirm"),
                    ),
                  if (submitFun != null) SizedBox(width: 10.sp),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange.shade900.withOpacity(0.8),
                    ),
                    onPressed: cancelFun ?? () => Get.back(),
                    child: Text("Cancel"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShowDialogWithBody extends StatelessWidget {
  ShowDialogWithBody({
    Key? key,
    this.title,
    required this.body,
    this.submitText,
    this.submitFun,
    this.cancel,
    this.cancelText,
    this.cancelFun,
    this.customButton,
    this.obx = false,
  }) : super(key: key);

  final String? title;
  final Widget body;
  final String? submitText;
  final Function()? submitFun;
  final bool? cancel;
  final String? cancelText;
  final Function()? cancelFun;
  final List<Map<String, dynamic>>? customButton;
  final bool obx;

  @override
  Widget build(BuildContext context) {
    bool cancelSet = cancel ?? true;
    return WillPopScope(
      onWillPop: () => appClose(),
      child: Center(
        child: Container(
          width: 100.w,
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.all(20.sp),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.sp)),
            gradient: LinearGradient(colors: dilogBgColor),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (title != null)
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15.sp, horizontal: 10.sp),
                  child: Text(
                    title ?? "Dialog Title",
                    style: dilogHeaderText,
                  ),
                ),
              ConstrainedBox(
                constraints: BoxConstraints(minHeight: 5.h, maxHeight: 50.h),
                child: AnimatedContainer(
                  width: 100.w,
                  duration: Duration(seconds: 1),
                  padding: obx != true ? EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.sp) : EdgeInsets.zero,
                  decoration: dilogBodyDecoration,
                  child: body,
                ),
              ),
              if (obx != true)
                Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.all(10.sp),
                  decoration: dilogBottomDecoration,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: customButton == null
                        ? [
                            if (submitFun != null)
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  gradient: LinearGradient(colors: buttonColor),
                                ),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    padding: EdgeInsets.symmetric(vertical: 12.sp),
                                    visualDensity: VisualDensity.compact,
                                  ),
                                  onPressed: submitFun,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                                    child: Text(
                                      submitText ?? "Conform",
                                      style: GoogleFonts.radley(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            if (submitFun != null) SizedBox(width: 10.sp),
                            if (cancelSet)
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  gradient: LinearGradient(colors: dilogCancelButtonColor),
                                ),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    padding: EdgeInsets.symmetric(vertical: 12.sp),
                                    visualDensity: VisualDensity.compact,
                                  ),
                                  onPressed: cancelFun ?? () => Get.back(),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                                    child: Text(
                                      cancelText ?? "Cancel",
                                      style: GoogleFonts.radley(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ]
                        : customButton!
                            .map(
                              (optBtn) => Container(
                                margin: optBtn['margin'] ?? EdgeInsets.zero,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  gradient: LinearGradient(colors: optBtn['colors'] ?? dilogCancelButtonColor),
                                ),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    foregroundColor: HSLColor.fromColor(optBtn['colors'][0]).withLightness(1).toColor(),
                                    padding: EdgeInsets.symmetric(vertical: 12.sp),
                                    visualDensity: VisualDensity.compact,
                                  ),
                                  onPressed: optBtn['function'] ?? () => Get.back(),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                                    child: Text(
                                      optBtn['title'] ?? "Cancel",
                                      style: GoogleFonts.radley(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
