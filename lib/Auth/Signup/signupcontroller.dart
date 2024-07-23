import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practicefirebase/Auth/Login/login.dart';
import 'package:practicefirebase/Models/signupmodel.dart';
import 'package:practicefirebase/utills/static_values.dart';
import 'package:practicefirebase/utills/toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class signupController extends GetxController {
  static signupController get intance => Get.find();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool loading = false;

//     Signup Method .........................................................................

  signupMethod() async {
    try {
      loading = true;
      update();

      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then(
        (value) async {
          // send data to firebase by using   MOdel.....................................................
          Signupmodel model = Signupmodel(
              name: nameController.text.toString(),
              email: emailController.text.toString(),
              password: passwordController.text,
              id: staticValues.firebaseAuth.currentUser!.uid);

          // set current user id as static ...................................................
          staticValues.userId = model.id;

          staticValues.firebaseFirestore
              .collection('Users')
              .doc(staticValues.userId)
              .set(model.toMap());

          //        clear all controller.....................................................
          nameController.clear();
          emailController.clear();
          passwordController.clear();
        },
      ).then((data) {
        Get.to(LoginPage());
      });
      showtoast(message: 'Registration Successful', iserror: false);

     
      loading = false;
      update();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      showtoast(message: 'Network Error', iserror: true);
      loading = false;
      update();
    } catch (e) {
      showtoast(message: 'Registration Failed', iserror: true);

      loading = false;
      update();
    }
  }
}
