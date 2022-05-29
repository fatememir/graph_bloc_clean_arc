import 'package:flutter/material.dart';

import '../../utils/my_colors.dart';

class LoginTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;

  const LoginTextField({
    required this.labelText,
    this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.headline3,
      textInputAction: TextInputAction.next,
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: MyColors.regentGray),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: MyColors.blue),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1),
        ),
        labelText: labelText,
        labelStyle: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }
}
