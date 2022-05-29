import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginImage extends StatelessWidget {
  final String image;
  const LoginImage({
    required this.image,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      image,
      width: 96,
      height: 96,
    );
  }
}
