import 'package:bite_bazzar/presentation/common_widgets/small_text.dart';
import 'package:flutter/material.dart';

class IconWithText extends StatelessWidget {
  const IconWithText({super.key, required this.icon, required this.text, required this.iconColor});

  final IconData icon;
  final String text;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor),
        const SizedBox(width: 5),
        SmallText(text: text),
      ],
    );
  }
}