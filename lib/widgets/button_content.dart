import 'package:flutter/material.dart';

class ButtonContent extends StatelessWidget {
  final String type;
  final Color colors;

  ButtonContent({
    required this.type,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Text(
          type,
          style: TextStyle(
            fontSize: 60,
            color: colors,
            fontFamily: Theme.of(context).textTheme.bodyMedium?.fontFamily,
          ),
        ),
      ),
    );
  }
}
