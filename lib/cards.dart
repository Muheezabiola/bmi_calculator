import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  final Color colour;
  final Widget? cardChild;
  final Function()? whenPressed;
  const Cards({super.key, required this.colour, this.cardChild, this.whenPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: whenPressed,
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: cardChild,
      ),
    );
  }
}
