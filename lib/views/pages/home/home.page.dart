import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safewheel/app/models/pokemons.model.dart';
import 'package:safewheel/init/contractors.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import '../../../app/controllers/home/home.cont.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final HomeController homeCont = Get.find();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => appClose(),
      child: Scaffold(
        body: Container(
          height: 100.h,
          width: 100.w,
          decoration: BoxDecoration(
            color: HSLColor.fromColor(tColor).withLightness(0.95).toColor(),
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
                          padding: EdgeInsets.symmetric(horizontal: 5.sp, vertical: 8.sp),
                          child: Image.asset(
                            "assets/images/logo.png",
                            width: 10.w,
                            // color: Colors.amber,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5.sp),
                          child: Text(
                            "Home Page".toUpperCase(),
                            style: GoogleFonts.openSans(
                              color: HSLColor.fromColor(tColor).withLightness(0.1).toColor(),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5.sp),
                          child: InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.more_vert,
                              color: HSLColor.fromColor(tColor).withLightness(0.2).toColor(),
                              size: 20.sp,
                            ),
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
                  if (homeCont.onLoadPokemon.value && homeCont.pokemonList.isNotEmpty) {
                    return ListView.builder(
                      padding: EdgeInsets.all(10.sp),
                      physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
                      itemCount: homeCont.pokemonList.length,
                      itemBuilder: (context, index) {
                        MPokemon pokoman = homeCont.pokemonList[index];
                        return InkWell(
                          onTap: () => homeCont.clickAction(pokoman),
                          child: Card(
                            child: Row(
                              children: [
                                CachedNetworkImage(
                                  imageUrl: pokoman.image!,
                                  imageBuilder: (context, imageProvider) {
                                    return Container(
                                      width: 30.w,
                                      padding: EdgeInsets.all(10.sp),
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
                                    child: Container(
                                      width: 30.w,
                                      height: 30.w,
                                      padding: EdgeInsets.all(10.sp),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    title: Text(pokoman.name!),
                                    subtitle: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Weight : ${pokoman.weight!.maximum}"),
                                        Text("Height : ${pokoman.height!.maximum}"),
                                      ],
                                    ),
                                    trailing: Icon(Icons.more_vert),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else if (homeCont.onLoadPokemon.value && homeCont.pokemonList.isEmpty) {
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
                  } else {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey,
                      highlightColor: Colors.white,
                      period: Duration(seconds: 2),
                      enabled: true,
                      child: ListView.builder(
                        padding: EdgeInsets.all(10.sp),
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Container(
                              height: 15.h,
                            ),
                          );
                        },
                      ),
                    );
                  }
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
