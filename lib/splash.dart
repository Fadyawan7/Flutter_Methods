import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practicefirebase/Auth/Google_signin/googlesignin.dart';
import 'package:practicefirebase/Auth/Phone_Method/phone_authuntication.dart';
import 'package:practicefirebase/Auth/Signup/signup.dart';
import 'package:practicefirebase/Views/Dashboard/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
      () {
        checkUser();
        // Get.to(() => Signup());
      },
    );
  }

  checkUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    var user = pref.getString('userId');
    if (user!=null && user.isNotEmpty ) {
      Get.to(()=> Dashboard());
    } else {
      Get.to(()=>Signup());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(
        'Splash',
        style: TextStyle(fontSize: 20),
      ),
    ));
  }
}
