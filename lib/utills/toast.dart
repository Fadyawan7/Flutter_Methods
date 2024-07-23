import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showtoast({required String message, required bool iserror}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor:
          iserror ? const Color.fromRGBO(244, 67, 54, 1) : Colors.green,
      textColor: Colors.white,
      fontSize: 16.0);
}