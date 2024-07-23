// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import 'package:practicefirebase/Auth/Phone_Method/otpcontroller.dart';
import 'package:practicefirebase/Views/Dashboard/dashboard.dart';
import 'package:practicefirebase/utills/static_values.dart';
import 'package:practicefirebase/widgets/button.dart';
import 'package:practicefirebase/widgets/textformfield.dart';

class OtpScreen extends StatefulWidget {
  String Verificationid;
  TextEditingController nameController;
  TextEditingController emailController;
  TextEditingController passwordController;
  TextEditingController phoneController;

  OtpScreen({
    Key? key,
    required this.Verificationid,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.phoneController,
  }) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('Verify Otp'),
        centerTitle: true,
      ),
      body: GetBuilder<Otpcontroller>(
          init: Otpcontroller(),
          builder: (obj) {
            return Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.1,
                  ),
                  CustomFormField(
                    controller: obj.otpController,
                    hint: 'otp',
                    labell: 'otp',
                  ),
                  SizedBox(
                    height: height * 0.1,
                  ),
                  CustomButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          obj.recieveCode(
                              widget.Verificationid,
                              widget.nameController.text,
                              widget.emailController.text,
                              widget.passwordController.text,
                              widget.phoneController.text);
                        }
                      },
                      title: 'Verify Otp',
                      loading: obj.loading),
                ],
              ),
            );
          }),
    );
  }
}
