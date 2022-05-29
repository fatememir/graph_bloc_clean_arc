import 'package:flutter/material.dart';

class JaanLogoWithText extends StatelessWidget {
  const JaanLogoWithText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/jaan_icon.png',
            width: 32,
            height: 32,
          ),
          const SizedBox(width: 8),
          Text("جآن", style: Theme.of(context).textTheme.headline1)
        ],
      ),
    );
  }
}
