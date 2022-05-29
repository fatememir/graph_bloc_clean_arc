import 'package:flutter/material.dart';

import '../../utils/my_colors.dart';

class SmallBlueButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool status;

  const SmallBlueButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.status = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: status ? 1 : 0.25,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ElevatedButton(
          child: Row(
            children: [
              Text(
                text,
                style: const TextStyle(
                    fontSize: 18,
                    fontFamily: "IranYekan",
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(width: 12),
              const Icon(Icons.arrow_forward_ios),
            ],
          ),
          onPressed: () {
            if (status) {
              onPressed();
            }
          },
          style: ElevatedButton.styleFrom(
            primary: MyColors.blue,
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 16,
            ),
          ),
        ),
      ),
    );
  }
}
