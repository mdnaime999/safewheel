import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../views/widgets/dialog.dart';

class InitVariable {
  // Base URL
  // final String baseUrl = "https://4vriaxxxk3.execute-api.ca-central-1.amazonaws.com/";
  // API Base URL
  final String baseApi = "https://graphql-pokemon2.vercel.app/";
  // final String baseWebSocket = "ws://dev-badhan.stylezworld.net:1234";
  final String query = "?query=";

  final String pokemons = "{pokemons(first:10){id number name height{minimum maximum}weight{minimum maximum}classification image}}";

  Uri apiUri(String url) {
    return Uri.parse(baseApi + query + url);
  }
}

class ToAvater {
  ToAvater({required this.name, this.bg = "0D8ABC", this.text = "FFFFFF"});
  String name;
  String bg;
  String text;

  String nameToAvater() {
    var nameArray = name.replaceAll("+", " ");
    return "https://ui-avatars.com/api/?background=$bg&color=$text&name=$nameArray";
  }
}

Color tColor = Colors.indigo;
List<Color> buttonColor = [
  Color(0xFFC1202C),
  Color(0XFFF05a26),
];

final dilogBgColor = [
  HSLColor.fromColor(tColor).withLightness(0.5).toColor(),
  HSLColor.fromColor(tColor).withLightness(0.95).toColor()
];
final dilogSaveButtonColor = [
  Color(0xFFC1202C),
  Color(0XFFF05a26),
];
final dilogOptionButtonColor = [
  Colors.indigo.shade300,
  Colors.indigo.shade100,
];
final dilogCancelButtonColor = [
  Colors.grey.shade700,
  Colors.grey,
];
final dilogHeaderText = GoogleFonts.raleway(
  fontSize: 18.sp,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);
final dilogBodyDecoration = BoxDecoration(
  color: Color(0xFFFFFFFF),
  borderRadius: BorderRadius.only(
    // topLeft: Radius.circular(30.sp),
    topRight: Radius.circular(30.sp),
  ),
);
final dilogBottomDecoration = BoxDecoration(
  color: Color(0xFFFFFFFF),
  border: Border(top: BorderSide(color: Colors.grey)),
);

class AppColors {
  Color tColor = Color(0xFFBE1E2D);
  final buttonColor = [
    Color(0xFFC1202C),
    Color(0XFFF05a26),
  ];

  final cancelButtonColor = [
    Color(0xFFC1202C),
    Color(0XFFF05a26),
  ];

  final inActiveButtonColor = [
    Color(0xFFC1202C).withOpacity(0.4),
    Color(0XFFF05a26).withOpacity(0.4),
  ];

  final btnColor = Color(0XFFF05a26);
  final circleColor = Color(0XFFC1272D);
  final buttonTextColor = Colors.white;

  final textColor = Color(0xff424143);
  final textColorBlue = Color(0xff044d9e);
  final dropDownTextColor = Color(0xffc1272d);
  final hintTextColor = Color(0xFFb4b4b5);
  final bgColor = Color(0xfff2f2f2);
  final fillColor = Color(0xffffffff);
  final fillColorDark = Color(0xffd3d3d3);
}

Future<bool> appClose() async {
  Get.dialog(
    ShowDialogWithBody(
      title: "Attention please !!",
      body: Container(
        padding: EdgeInsets.all(10.sp),
        decoration: BoxDecoration(
          border: Border.all(color: tColor),
          borderRadius: BorderRadius.circular(10.sp),
        ),
        child: Text(
          "Do you want to close this application ?",
          style: GoogleFonts.openSans(
            color: tColor,
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      submitText: "Exit",
      submitFun: () async {
        Get.back();
        SystemNavigator.pop(animated: true);
      },
    ),
    barrierDismissible: false,
  );
  return false;
}
