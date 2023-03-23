import 'package:flutter/material.dart';

class MainPageDescriptionText extends StatelessWidget {
  final double deviceWidth;

  MainPageDescriptionText(this.deviceWidth);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(
            top: 5,
            left: 3,
          ),
          width: deviceWidth,
          child: Text(
            'Understand',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            top: 5,
            left: 10,
          ),
          width: deviceWidth,
          child: Text(
            'and',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            top: 5,
            left: 3,
          ),
          width: deviceWidth,
          child: Text(
            'Communicate With Your Pets',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
