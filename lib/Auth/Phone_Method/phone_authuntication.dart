import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:practicefirebase/Auth/Phone_Method/phone_controller.dart';
import 'package:practicefirebase/Auth/Reset_Password/reset_password.dart';
import 'package:practicefirebase/widgets/button.dart';
import 'package:practicefirebase/widgets/textformfield.dart';

class PhoneAuthuntication extends StatelessWidget {
  PhoneAuthuntication({super.key});
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Phone Authuntication'),
        centerTitle: true,
      ),
      body: GetBuilder<PhoneController>(
          init: PhoneController(),
          builder: (obj) {
            return Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.1,
                  ),
                  CustomFormField(
                    controller: obj.nameController,
                    hint: 'name',
                    labell: 'Name',
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  CustomFormField(
                    controller: obj.emailController,
                    hint: 'email',
                    labell: 'Email',
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  CustomFormField(
                    controller: obj.passwordController,
                    hint: 'password',
                    labell: 'Password',
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  CustomFormField(
                    controller: obj.phoneController,
                    hint: 'phone',
                    labell: 'Phone',
                  ),
                  SizedBox(
                    height: height * 0.1,
                  ),
                  CustomButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                       //   if(obj.phoneController==)
                          obj.sendCode();
                        }
                      },
                      title: 'Phone Verification',
                      loading: obj.loading),
                ],
              ),
            );
          }),
    );
  }
}
