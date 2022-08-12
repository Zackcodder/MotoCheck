// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:motocheck/constants/colors.dart';
import 'package:motocheck/constants/text_style.dart';

class ReuseableContainer extends StatelessWidget {
  ReuseableContainer ({ required this.label, });

  String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kBoxstyle,
      padding: EdgeInsets.only(bottom: 18.0, left: 18.0, top: 10.0),
      margin: EdgeInsets.only(left: 24.0, right: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text(
                'Mr. Joseph Agunbiade',
                style: kRecentheadertextstyle,
              ),
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(left: 82.0, top: 20.0),
                decoration: BoxDecoration(
                  color: kBackground,
                  borderRadius: BorderRadius.all(
                    Radius.circular(4.0),
                  ),
                ),
                height: 23.0,
                width: 54,
                child: Center(
                  child: Text(label,
                  textAlign:TextAlign.center,
                    style: kChecktextstyle,),
                ),
              ),
            ],
          ),
          Text(
            'Benz 2014 EClass',
            style: kRecentbodytextstyle,
          ),
          Divider(
            height: 40.0,
            indent: 20.0,
            endIndent: 20.0,
          ),
          Row(
            children: [
              Icon(
                FontAwesomeIcons.clock,
                color: kViewalltextColor,
              ),
              SizedBox(
                width: 10.0,
              ),
              Text('14 July, 4:00 - 7:00pm'),
            ],
          ),
        ],
      ),
    );
  }
}
