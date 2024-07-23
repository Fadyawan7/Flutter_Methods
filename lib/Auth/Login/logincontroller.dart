import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:practicefirebase/utills/static_values.dart';
import 'package:practicefirebase/utills/toast.dart';
import 'package:practicefirebase/Views/Dashboard/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Logincontroller extends GetxController {
  static Logincontroller get instance => Get.find();

 
  bool loading = false;



//.......Login with gmail and password ...................................................

  Future logininMethod(String email ,String password) async {
    try {
      loading = true;
      update();
    
      var data = await staticValues.firebaseFirestore
          .collection('Users')
          .where('email', isEqualTo: email)
          .where(
            'password',
            isEqualTo: password,
          )
          .get()
          .then((data)async {
        if (data.docs.isNotEmpty) {
          showtoast(message: "login successfully!", iserror: false);
           // save user data into shared prefrence ..............................................

      SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.setString('userId', staticValues.userId.toString());
      

          Get.to(Dashboard());
        } else {
          showtoast(message: "Enter correct email", iserror: true);
        }
        loading = false;
        update();
      });
    } on FirebaseAuthException {
      showtoast(message: 'Something went wrong', iserror: true);
      loading = false;
      update();
    } catch (e) {
      loading = false;
      update();
      showtoast(message: 'Login Failed ,please try again', iserror: true);
    }
  }














}
