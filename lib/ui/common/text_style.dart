import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transiter_driver/ui/common/app_colors.dart';

const double _size12 = 12;
const double _size14 = 14;
const double _size15 = 15;
const double _size16 = 16;
const double _size18 = 18;
const double _size20 = 20;
const double _size22 = 22;
const double _size23 = 23;
const double _size50 = 50;

const FontWeight _normalWeight = FontWeight.w400;
const FontWeight _weight500 = FontWeight.w500;
const FontWeight _weight600 = FontWeight.w600;
const FontWeight _boldWeight = FontWeight.w700;

TextStyle ktsBoldText50 = _base(_size50, _boldWeight, kcBlack);
TextStyle ktsBoldText23 = _base(_size23, _boldWeight, kcBlack);
TextStyle ktsBoldText22 = _base(_size22, _boldWeight, kcBlack);
TextStyle ktsBoldText20 = _base(_size20, _boldWeight, kcBlack);
TextStyle ktsBoldText18 = _base(_size18, _boldWeight, kcBlack);
TextStyle ktsBoldText16 = _base(_size16, _boldWeight, kcBlack);
TextStyle ktsBoldText15 = _base(_size15, _boldWeight, kcBlack);

TextStyle buttonText = _base(_size18, _boldWeight, kcWhite);

TextStyle kts600text20 = _base(_size20, _weight600, kcWhite);
TextStyle kts500text20 = _base(_size20, _weight500, kcWhite);
TextStyle ktsNormaltext16 = _base(_size16, _normalWeight, kcBlack);
TextStyle ktsNormaltext15 = _base(_size15, _weight500, kcBlack);
TextStyle ktsNormaltext14 = _base(_size14, _weight600, kcBlack);
TextStyle ktsNormaltext13 = _base(_size14, _normalWeight, kcBlack);
TextStyle ktsNormaltext12 = _base(_size12, _normalWeight, kcBlack);
TextStyle tetiaryText = _base(_size16, _normalWeight, kcBlack);

//#base style
TextStyle _base(
  double size,
  FontWeight? fontWeight,
  Color? color,
) {
  return baseStyle(fontSize: size, fontWeight: fontWeight, color: color);
}

TextStyle baseStyle({
  double fontSize = 13,
  FontWeight? fontWeight,
  Color? color,
}) {
  return GoogleFonts.lato(
      fontSize: fontSize.sp,
      fontWeight: fontWeight ?? FontWeight.w500,
      color: color ?? Colors.grey[600]);
}

TextStyle fugazTextStyle({
  double fontSize = 13,
  FontWeight? fontWeight,
  Color? color,
}) {
  return GoogleFonts.fugazOne(
      fontSize: fontSize.sp,
      fontWeight: fontWeight ?? FontWeight.w500,
      color: color ?? Colors.grey[600]);
}
