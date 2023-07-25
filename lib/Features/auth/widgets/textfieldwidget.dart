// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../utils/pallate.dart';

class Textfieldwidget extends StatelessWidget {
  Textfieldwidget({
    super.key,
    required this.email, required this.hintText,
  });
  String hintText;

  final TextEditingController email;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: email,
      
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
           fontSize: 18
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Pallete.blueColor,width: 3)
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: Pallete.greyColor
          )
        )
      ),

          );
  }
}
