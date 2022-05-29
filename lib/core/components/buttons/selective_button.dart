import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/my_colors.dart';

class SelectiveButton extends StatelessWidget {
  final String text;
  final String? icon;
  final bool status;
  final Function onPressed;
  const SelectiveButton(
      {Key? key,
      required this.text,
      this.icon,
      required this.status,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        child: Row(
          children: [
            if (icon != null)
              SvgPicture.asset(
                icon!,
                color: status ? MyColors.blue : MyColors.quillGray,
                width: 24,
                height: 24,
              ),
            if (icon != null) const SizedBox(width: 12),
            Text(
              text,
              style: TextStyle(
                color: status
                    ? MyColors.blue
                    : Theme.of(context).textTheme.bodyText1?.color,
              ),
            ),
          ],
        ),
        style: ElevatedButton.styleFrom(
          alignment: Alignment.centerRight,
          primary: status ? MyColors.blue.withAlpha(20) : Colors.transparent,
          side: BorderSide(
            width: status ? 2 : 1,
            color: status ? MyColors.blue : MyColors.iron,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          minimumSize: const Size(double.infinity, 56),
          padding: const EdgeInsets.symmetric(horizontal: 32),
        ),
      ),
    );
  }
}
