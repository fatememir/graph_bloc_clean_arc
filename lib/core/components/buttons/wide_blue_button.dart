import 'package:flutter/material.dart';

import '../../utils/my_colors.dart';

class WideBlueButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool status;

  const WideBlueButton({
    required this.text,
    required this.onPressed,
    this.status = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: status ? 1 : 0.25,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ElevatedButton(
          child: Text(
            text,
            style: const TextStyle(
                fontSize: 16,
                fontFamily: "IranYekan",
                fontWeight: FontWeight.w600),
          ),
          onPressed: () {
            if (status) {
              onPressed();
            }
          },
          style: ElevatedButton.styleFrom(
              primary: MyColors.blue,
              shape: const StadiumBorder(),
              minimumSize: const Size(double.infinity, 16),
              padding: const EdgeInsets.symmetric(vertical: 16)),
        ),
      ),
    );
  }
}
