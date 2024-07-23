import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practicefirebase/Auth/Phone_Method/otp_screen.dart';
import 'package:practicefirebase/utills/static_values.dart';
import 'package:practicefirebase/utills/toast.dart';

class PhoneController extends GetxController {
  static PhoneController get instance => Get.find();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  bool loading = false;

  Future sendCode() async {
    loading = true;
    update();
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneController.text,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verificationId, int? resendToken) {
          Get.to(() => OtpScreen(Verificationid: verificationId, nameController: nameController,
           emailController: emailController, passwordController: passwordController, 
           phoneController: phoneController,));
          showtoast(message: 'Code sent', iserror: false);
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );

      loading = false;
      update();
    } on FirebaseAuthException {
      showtoast(message: 'network error', iserror: false);

      loading = false;
      update();
    } catch (ex) {
      showtoast(message: 'something went wrong', iserror: false);
      loading = false;
      update();
    }
  }
}
