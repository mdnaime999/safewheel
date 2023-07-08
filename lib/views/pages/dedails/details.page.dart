import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import '../../../app/controllers/details/details.cont.dart';
import '../../../app/models/pokemons.model.dart';
import '../../../init/contractors.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({super.key});
  final DetailsController detailsCont = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        decoration: BoxDecoration(
          color: HSLColor.fromColor(tColor).withLightness(0.98).toColor(),
        ),
        child: Column(
          children: [
            // ------------------------------------------------------------ Header
            Container(
              decoration: BoxDecoration(
                color: HSLColor.fromColor(tColor).withLightness(0.85).toColor(),
                boxShadow: [
                  BoxShadow(
                    color: HSLColor.fromColor(tColor).withLightness(0.7).toColor(),
                    blurRadius: 5,
                    spreadRadius: 0.5,
                    offset: Offset(1, 1),
                  ),
                ],
              ),
              child: SafeArea(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.w),
                  decoration: BoxDecoration(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5.sp),
                        child: InkWell(
                          onTap: () {
                            detailsCont.selectedPokoman.value = MPokemon();
                            Get.back();
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: HSLColor.fromColor(tColor).withLightness(0.2).toColor(),
                            size: 20.sp,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5.sp),
                        child: Text(
                          "Details Page".toUpperCase(),
                          style: GoogleFonts.openSans(
                            color: HSLColor.fromColor(tColor).withLightness(0.1).toColor(),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.sp, vertical: 8.sp),
                        child: Image.asset(
                          "assets/images/logo.png",
                          width: 10.w,
                          // color: Colors.amber,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // ------------------------------------------------------------ Body
            Expanded(
              child: Obx(() {
                MPokemon pokoman = detailsCont.selectedPokoman.value;
                if (pokoman.id != null) {
                  return Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // --------------------------------------------------- Image
                      CachedNetworkImage(
                        imageUrl: pokoman.image!,
                        imageBuilder: (context, imageProvider) {
                          return SizedBox(
                            width: 100.w,
                            child: Image(
                              image: imageProvider,
                              fit: BoxFit.fill,
                            ),
                          );
                        },
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: Colors.grey,
                          highlightColor: Colors.white,
                          period: Duration(seconds: 2),
                          enabled: true,
                          child: SizedBox(
                            width: 100.w,
                            height: 100.w,
                          ),
                        ),
                      ),
                      SizedBox(height: 3.h),
                      // --------------------------------------------------- Title
                      Container(
                        padding: EdgeInsets.all(10.sp),
                        child: Text(
                          "${pokoman.name}",
                          style: GoogleFonts.raleway(
                            color: HSLColor.fromColor(tColor).withLightness(0.3).toColor(),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.sp),
                        padding: EdgeInsets.only(bottom: 5.sp),
                        child: Text(
                          "Classification : ${pokoman.classification}",
                          style: GoogleFonts.openSans(
                            color: Colors.grey,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // --------------------------------------------------- Weight
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.sp),
                        padding: EdgeInsets.only(bottom: 5.sp),
                        child: Text(
                          "Weight : Min (${pokoman.weight!.minimum}), Max (${pokoman.weight!.maximum})",
                          style: GoogleFonts.openSans(
                            color: Colors.grey,
                            fontSize: 11.sp,
                          ),
                        ),
                      ),

                      // ---------------------------------------------------  Height
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.sp),
                        padding: EdgeInsets.only(bottom: 5.sp),
                        child: Text(
                          "Height : Min (${pokoman.height!.minimum}), Max (${pokoman.height!.maximum})",
                          style: GoogleFonts.openSans(
                            color: Colors.grey,
                            fontSize: 11.sp,
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 20.sp),
                      decoration: BoxDecoration(
                        border: Border.all(color: HSLColor.fromColor(tColor).withLightness(0.3).toColor()),
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      child: Text(
                        "No Pokemon",
                        style: GoogleFonts.raleway(
                          color: HSLColor.fromColor(tColor).withLightness(0.3).toColor(),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                }
              }),
            )
          ],
        ),
      ),
    );
  }
}
