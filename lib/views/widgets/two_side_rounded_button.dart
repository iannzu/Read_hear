import 'package:flutter/material.dart';
import 'package:read_hear/constants/colors.dart';

class TwoSideRoundedButton extends StatelessWidget {
  final String text;
  final double radius;
  final VoidCallback press;

  const TwoSideRoundedButton({
    Key? key,
    required this.text,
    required this.press,
    this.radius = 29,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: kBlackColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(radius),
            bottomRight: Radius.circular(radius),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
