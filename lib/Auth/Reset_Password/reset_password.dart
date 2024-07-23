import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practicefirebase/Auth/Reset_Password/reset_controller.dart';
import 'package:practicefirebase/widgets/button.dart';
import 'package:practicefirebase/widgets/textformfield.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reset Password',
        ),
        centerTitle: true,
      ),
      body: GetBuilder<ResetController>(
          init: ResetController(),
          builder: (obj) {
            return Column(
              children: [
                SizedBox(
                  height: height * 0.01,
                ),
                CustomFormField(
                  controller: obj.resetEmail,
                  hint: ' email',
                  labell: ' Email',
                ),
                SizedBox(
                  height: height * 0.1,
                ),
                CustomButton(
                    onPressed: () {
                      obj.resetPassword();
                    },
                    title: 'Reset Password',
                    loading: obj.loading),
              ],
            );
          }),
    );
  }
}
