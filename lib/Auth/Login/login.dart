import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:practicefirebase/Auth/Login/logincontroller.dart';
import 'package:practicefirebase/widgets/button.dart';
import 'package:practicefirebase/widgets/textformfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('Login'),
        centerTitle: true,
      ),
      body: GetBuilder<Logincontroller>(
          init: Logincontroller(),
          builder: (obj) {
            return Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.1,
                  ),
                  CustomFormField(
                    controller: emailController,
                    hint: 'email',
                    labell: 'Email',
                    validator: (value) {
                      if (value!.isEmpty || value == null) {
                        return 'Please Enter your Correct Email';
                      }
                    },
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  CustomFormField(
                    controller: passwordController,
                    hint: 'password',
                    labell: 'Password',
                    validator: (value) {
                      if (value!.isEmpty || value == null) {
                        return 'Please Enter your Correct Password';
                      }
                    },
                  ),
                  SizedBox(
                    height: height * 0.1,
                  ),
                  CustomButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          obj.logininMethod(
                              emailController.text.trim(), passwordController.text.trim());
                        }
                      },
                      title: 'Login',
                      loading: obj.loading)
                ],
              ),
            );
          }),
    );
  }
}
