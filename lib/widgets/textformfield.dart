import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String? description;
  final int? age;
  // bool? obscure;
  final TextEditingController controller;
  final String? hint;
  final String? labell;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final String? Function(String?)? validator;

  CustomFormField({
    super.key,
    this.description,
    this.age,
    required this.controller,
    this.minLines,
    this.maxLines,
    this.maxLength,
    this.hint,
    this.labell,
    this.validator,
    // this.obscure,
  });

  @override
  Widget build(BuildContext context) {
    bool obscure = true;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
          controller: controller,
          maxLength: maxLength,
          minLines: minLines,
          maxLines: maxLines,
          // obscureText: obscure,
          decoration: InputDecoration(
            errorStyle: TextStyle(fontSize: 10),
            hintText: hint,
            hintStyle: TextStyle(fontSize: 14),
            isDense: true,
            label: Text(
              labell.toString(),
              style: TextStyle(fontSize: 10),
            ),
            contentPadding: EdgeInsets.all(7),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide:
                    BorderSide(color: Colors.grey.shade300, width: 1.0)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide:
                    BorderSide(color: Colors.grey.shade300, width: 1.0)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide(color: Colors.red, width: 1.0)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide(color: Colors.red, width: 1.0)),
          ),
          validator: validator),
    );
  }
}
