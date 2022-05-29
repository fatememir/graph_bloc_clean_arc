import 'package:flutter/material.dart';

import '../../utils/my_colors.dart';

class BlueTextButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  const BlueTextButton({
    required this.text,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        text,
        style: const TextStyle(
          color: MyColors.blue,
          fontSize: 15,
          fontFamily: "IranYekan",
          fontWeight: FontWeight.w600,
        ),
      ),
      onPressed: () {
        onPressed();
      },
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      ),
    );
  }
}
