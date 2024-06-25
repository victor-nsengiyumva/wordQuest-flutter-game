import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final bool obscureText;
  final bool authText;
  final TextEditingController controller;
  final Color textcolor;
  final Color borderSideColor;
  final String label;
  final Color labelColor;
  final TextInputType keyBoardType;
  final Color backgroundColor;
  // final void Function(String) onChanged;

  const TextFieldCustom(
      {super.key,
      this.authText = false,
      this.obscureText = false,
      required this.controller,
      this.textcolor = Colors.black,
      this.borderSideColor = const Color(0xFF082163),
      required this.label,
      this.labelColor = Colors.grey,
      this.keyBoardType = TextInputType.name,
      this.backgroundColor = Colors.white,
      // required this.onChanged
      });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ? true : false,
      onFieldSubmitted: (value) {
        // this will  handle the checks when the field is submitted
        // but before the button to proceed is pressed
      },

      // this is used for search functionality where it returns
      // some of the results depending on the values that are
      // already in the field
      // onChanged: onChanged,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field cannot be empty';
        }
        return null;
      },
      style:
          TextStyle(color: authText ? Colors.white : textcolor, fontSize: 17),
      controller: controller,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: borderSideColor)),
          contentPadding: const EdgeInsets.only(top: 15, bottom: 15, left: 13),
          filled: true,
          fillColor: backgroundColor,
          // errorText:
          //     widget.controllerExist.isEmpty ? null : widget.controllerExist,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: borderSideColor)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: borderSideColor)),
          label: Text(label),
          labelStyle: TextStyle(color: labelColor)
          //hintText: 'username',

          ),
      keyboardType: TextInputType.name,

      //  keyboardType: TextInputType.name,
    );
  }
}
