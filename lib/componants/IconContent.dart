import 'package:flutter/material.dart';
import 'package:basic_widget/componants//constans.dart';

class IconContent extends StatelessWidget {
  final IconData icon;
  final String text;

  IconContent({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        Text(
          text,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
