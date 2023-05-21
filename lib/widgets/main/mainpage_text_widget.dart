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
            style: Theme.of(context).textTheme.displayMedium,
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
            style: Theme.of(context).textTheme.displaySmall,
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
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
      ],
    );
  }
}
