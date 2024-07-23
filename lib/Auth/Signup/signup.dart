import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practicefirebase/Auth/Login/login.dart';
import 'package:practicefirebase/Auth/Phone_Method/phone_authuntication.dart';
import 'package:practicefirebase/Auth/Reset_Password/reset_password.dart';
import 'package:practicefirebase/Auth/Signup/signupcontroller.dart';
import 'package:practicefirebase/widgets/button.dart';
import 'package:practicefirebase/widgets/textformfield.dart';

class Signup extends StatelessWidget {
  Signup({super.key});
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Signup'),
        centerTitle: true,
      ),
      body: GetBuilder<signupController>(
          init: signupController(),
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
                    height: height * 0.1,
                  ),
                  CustomButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          obj.signupMethod();
                        }
                      },
                      title: 'SignUp',
                      loading: obj.loading),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(ResetPassword());
                        },
                        child: Text(
                          'Reset Password',
                          style: TextStyle(fontSize: height * 0.03),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.05,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(LoginPage());
                        },
                        child: Text(
                          'Login screen',
                          style: TextStyle(fontSize: height * 0.03),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.05,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                          onTap: () {
                            Get.to(PhoneAuthuntication());
                          },
                          child: Text(
                            'Phone Auth',
                            style: TextStyle(fontSize: height * 0.03),
                          )),
                      SizedBox(
                        width: width * 0.05,
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
