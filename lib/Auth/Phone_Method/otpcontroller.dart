import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practicefirebase/Auth/Login/login.dart';
import 'package:practicefirebase/Views/Dashboard/dashboard.dart';
import 'package:practicefirebase/utills/static_values.dart';
import 'package:practicefirebase/utills/toast.dart';

class Otpcontroller extends GetxController {
  static Otpcontroller get instance => Get.find();

  final otpController = TextEditingController();

  bool loading = false;

  Future recieveCode(
      String Verificationid,
      String nameController,
      String emailController,
      String passwordController,
      String phoneController) async {
    loading = true;
    update();
    try {
      // Create a PhoneAuthCredential with the code............................................................
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: Verificationid, smsCode: otpController.text);

      // Sign the user in (or link) with the credential............................................................
      UserCredential getcurentUserId =
          await staticValues.firebaseAuth.signInWithCredential(credential);
      staticValues.userId = getcurentUserId.user?.uid;

//.....Store user Data to firestore ....................................................................................
      await staticValues.firebaseFirestore
          .collection('Users')
          .doc(staticValues.userId)
          .set({
        'name': nameController,
        'email': emailController,
        'password': passwordController,
        'phone': phoneController,
        'id': staticValues.userId
      });
      showtoast(message: 'Signup Successfully', iserror: false);
      Get.to(() => LoginPage());

      loading = false;
      update();
    } catch (e) {
      loading = true;
      update();
      showtoast(message: 'Something went wrong', iserror: false);
    }
  }
}
