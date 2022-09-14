import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    this.prefixIcon,
    this.keytype,
    this.lebelText,
    this.maxNumber,
    this.controller,
    this.validator,
    this.data,
    this.hintText,
    this.initialText,
    this.suffixIcon,
    this.formatter,
    required this.obscureText,
  });

  // CustomTextField({
  //   this.prefixIcon,
  //   this.keytype,
  //   this.lebelText,
  //   this.maxNumber,
  //   this.controller,
  //   this.validator,
  //   this.data,
  //   this.hintText,
  //   this.initialText,
  //   this.suffixIcon,
  //   this.formatter,
  //   this.obscureText,
  // });

  final TextEditingController? controller;
  final dynamic data;
  final Icon? prefixIcon;
  final IconButton? suffixIcon;
  final String? initialText;
  final dynamic validator;
  final String? hintText;
  final int? maxNumber;
  final String? lebelText;
  final dynamic formatter;
  final dynamic keytype;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        //showCursor: true,
        minLines: 1,
        maxLines: maxNumber ?? 1,
        initialValue: initialText,
        keyboardType: keytype,
        controller: controller,
        inputFormatters: formatter,
        obscureText: obscureText,
        validator: validator,

        //onSaved: (String value) => data[keyy] = value,
        onChanged: (initialText) => {},
        autofocus: false,
        style: TextStyle(fontSize: 14.0, color: Colors.black54),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            gapPadding: 5.0,
            borderSide: BorderSide(color: Colors.red, width: 2.5),
          ),
          labelText: lebelText,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          labelStyle: TextStyle(color: Colors.black54, fontSize: 16),
          hintText: hintText,
        ),
      ),
    );
  }
}
