import 'package:flutter/material.dart';
import 'constants.dart';

class GenderChild extends StatelessWidget {
  final IconData genderIcon;
  final String genderText;
  const GenderChild(
      {super.key, required this.genderIcon, required this.genderText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(genderIcon, size: 80),
        const SizedBox(height: 15),
        Text(
          genderText,
          style: myTextStyle,
        ),
      ],
    );
  }
}
