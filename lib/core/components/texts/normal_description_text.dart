import 'package:flutter/material.dart';

class NormalDescriptionText extends StatelessWidget {
  final String text;
  const NormalDescriptionText({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyText1,
    );
  }
}
