import 'package:flutter/material.dart';

class ExtraBoldTitle extends StatelessWidget {
  final String title;
  const ExtraBoldTitle({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headline1,
    );
  }
}
