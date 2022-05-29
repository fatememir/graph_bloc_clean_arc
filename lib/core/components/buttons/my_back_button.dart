import 'package:flutter/material.dart';

import '../../utils/my_colors.dart';

class MyBackButton extends StatelessWidget {
  final Function onPressed;
  const MyBackButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ElevatedButton(
        child: const Icon(Icons.arrow_back_ios, color: MyColors.quillGray),
        onPressed: () {
          onPressed();
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          side: const BorderSide(
            width: 1,
            color: MyColors.quillGray,
          ),
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(16),
        ),
      ),
    );
  }
}
