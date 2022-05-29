import 'package:flutter/material.dart';

class SmallDescriptionText extends StatelessWidget {
  final String text;
  const SmallDescriptionText({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyText2,
    );
  }
}
