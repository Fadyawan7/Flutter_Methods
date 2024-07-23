import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practicefirebase/utills/static_values.dart';
import 'package:practicefirebase/utills/toast.dart';

class ResetController extends GetxController {
  static ResetController get instance => Get.find();

  TextEditingController resetEmail = TextEditingController();
  bool loading = false;

  // reset your password ,,,,,,,,,,,,................................................

  Future resetPassword() async {
    try {
      loading = true;
      update();
      await staticValues.firebaseAuth
          .sendPasswordResetEmail(email: resetEmail.text)
          .then(
        (value) {
          showtoast(
              message: 'Password reset instructions have been sent to email. ',
              iserror: true);
        },
      );
         loading = false;
      update();
    } catch (error) {
         loading = false;
      update();
      showtoast(
          message: 'An error occurred. Please try again. ', iserror: false);
    }
  }
}
