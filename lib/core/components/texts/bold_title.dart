import 'package:flutter/material.dart';

class BoldTitle extends StatelessWidget {
  final String title;
  const BoldTitle({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headline2,
    );
  }
}
