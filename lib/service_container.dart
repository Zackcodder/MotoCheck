// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:motocheck/constants/colors.dart';
import 'package:motocheck/constants/text_style.dart';

class ServiceContainer extends StatelessWidget {
  ServiceContainer({required this.label, required this.Containerchild});

  String label;
  Widget Containerchild;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      decoration: kBoxstyle,
      margin: EdgeInsets.only(top: 20.0, left: 24.0, right: 24.0),
      padding: EdgeInsets.only(top: 18.0, left: 18.0, right: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 46.19, right: 33.94 ),
            child: Containerchild,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text(
                label,
                textAlign: TextAlign.left,
                style: kServiceHeadertextstyle,
              ),
              SizedBox(
                height: 18.0,
              ),
              Text(
                "Contrary to popular belief, \n Lorem Ipsum dior",
                style: kServicebodytextstyle,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 56.0, left: 13.0),
            child: Icon(
              FontAwesomeIcons.longArrowAltRight,
              color: kArrowColor,
            ),
          ),
        ],
      ),
      
    );
    
  }
}
