// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'colors.dart';

const kBorderstyle = OutlineInputBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(10.0),
  ),
  borderSide: BorderSide.none,
);

final kBoxstyle =
    BoxDecoration(
      color: kBox1Color,
       borderRadius: BorderRadius.circular(4.0));

const kSidebartextstyle = TextStyle(
    color: kMainTextColor,
    fontWeight: FontWeight.w400,
    fontFamily: 'Sofia Pro',
    fontSize: 15.0,
    fontStyle: FontStyle.normal);

const kRecentbodytextstyle = TextStyle(
    color: kRecentSubtextColor,
    fontWeight: FontWeight.w400,
    fontFamily: 'Sopia Pro',
    fontSize: 13.0,
    fontStyle: FontStyle.normal);

const kRecentheadertextstyle = TextStyle(
    color: kMainTextColor,
    fontWeight: FontWeight.w400,
    fontFamily: 'Sopia Pro',
    fontSize: 15.0,
    fontStyle: FontStyle.normal);

const kRecenttextstyle = TextStyle(
    color: kMainTextColor,
    fontWeight: FontWeight.w600,
    fontFamily: 'Sopia Pro',
    fontSize: 20.0,
    fontStyle: FontStyle.normal);

const kServiceHeadertextstyle = TextStyle(
    color: kMainTextColor,
    fontWeight: FontWeight.w400,
    fontFamily: 'Sopia Pro',
    fontSize: 16.0,
    fontStyle: FontStyle.normal);

const kServicebodytextstyle = TextStyle(
    color: kBoxtextColor,
    fontWeight: FontWeight.w400,
    fontFamily: 'Sopia Pro',
    fontSize: 14.0,
    fontStyle: FontStyle.normal);

const kChecktextstyle = TextStyle(
    color: kCheckBoxColor,
    fontWeight: FontWeight.w400,
    fontFamily: 'Sopia Pro',
    fontSize: 11.0,
    fontStyle: FontStyle.normal);