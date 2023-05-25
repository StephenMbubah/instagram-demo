
import 'package:flutter/material.dart';
import 'package:instagram_demo/utils/colors.dart';

class ReuseableTextfield extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPasswordType;
  final String hintText;
  final TextInputType textInputType;
  const ReuseableTextfield({Key? key,
    required this.textEditingController,
    required this.isPasswordType,
    required this.hintText,
    required this.textInputType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
    borderSide: Divider.createBorderSide(context)
    );
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintText,
        border: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        filled: true,
        contentPadding: EdgeInsets.all(8),
      ),
      keyboardType: textInputType,
      obscureText: isPasswordType,

    );
  }
}

Container ReuseableContainer(String text,){
  return Container(
    child: Text(text),
    width: double.infinity,
    alignment: Alignment.center,
    padding: EdgeInsets.symmetric(vertical: 12),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(4),
      color: blueColor
    ),

  );
}