import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:practicefirebase/Models/signupmodel.dart';
import 'package:practicefirebase/utills/static_values.dart';

class GooglesignContoller extends GetxController {
  static GooglesignContoller get instance => Get.find();
  ValueNotifier userdata = ValueNotifier('');

  //...............Google Login Method..............................

  Future<dynamic> signInWithGoogle() async {
    try {
      //...............google SignIn..............................................
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final UserCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
//...........find user and store user data to firestore .................................

      final user = UserCredential.user;
      final userId = UserCredential.user!.uid;

      await staticValues.firebaseFirestore.collection('Users').doc(userId).set({
        'name': user!.displayName,
        'email': user.email,
        'id': userId,
        'profileUrl': user.photoURL,
        'phoneNumber': user.phoneNumber
      });
      return UserCredential;
    } on Exception catch (e) {
      // TODO
      print('exception->$e');
    }
  }

//...........Logout...........................................

  Future<bool> signOutFromGoogle() async {
    try {
      await FirebaseAuth.instance.signOut();
      return true;
    } on Exception catch (_) {
      return false;
    }
  }
}
