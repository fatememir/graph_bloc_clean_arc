import 'package:flutter/material.dart';

import '../../utils/my_colors.dart';

class MyTextField extends StatefulWidget {
  final String labelText;
  final TextEditingController? controller;

  const MyTextField({
    required this.labelText,
    this.controller,
    Key? key,
  }) : super(key: key);

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  RegExp persianValidator = RegExp("^[\u0600-\u06FF]+\$");
  bool isAPersianCharacter = true;

  void setValidator(valid) {
    setState(() {
      isAPersianCharacter = valid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.headline3,
      textInputAction: TextInputAction.next,
      controller: widget.controller,
      onChanged: (inputValue) {
        if (inputValue.isEmpty || persianValidator.hasMatch(inputValue)) {
          setValidator(true);
        } else {
          setValidator(false);
        }
      },
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
          labelText: widget.labelText,
          labelStyle: Theme.of(context).textTheme.bodyText2,
          errorText: isAPersianCharacter
              ? null
              : "نیاز هست که نام خودتون رو به فارسی بنویسید"),
    );
  }
}
