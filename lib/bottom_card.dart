import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';

class BottomCard extends StatelessWidget {
  final Function() bottomPressedPlus;
  final Function() bottomPressedMinus;
  final String title;
  final String displayText;
  final String? tag1;
  final String? tag2;
  const BottomCard({
    super.key,
    required this.bottomPressedPlus,
    required this.title,
    required this.bottomPressedMinus,
    required this.displayText,
    this.tag1,
    this.tag2,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title, style: myTextStyle),
        Text(displayText, style: mynumberStyle),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              heroTag: tag1,
              shape: const CircleBorder(),
              onPressed: bottomPressedMinus,
              backgroundColor: const Color(0xFF4C4F5E),
              child: const Icon(FontAwesomeIcons.minus),
            ),
            const SizedBox(width: 10),
            FloatingActionButton(
              heroTag: tag2,
              shape: const CircleBorder(),
              onPressed: bottomPressedPlus,
              backgroundColor: const Color(0xFF4C4F5E),
              child: const Icon(FontAwesomeIcons.plus),
            ),
          ],
        )
      ],
    );
  }
}
