import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practicefirebase/Auth/Google_signin/googleSign_contoller.dart';

class Googlesignin extends StatelessWidget {
  Googlesignin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google SignIn'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: GetBuilder<GooglesignContoller>(
          init: GooglesignContoller(),
          builder: (obj) {
            return ValueListenableBuilder(
              valueListenable: obj.userdata,
              builder: (context, value, child) {
                return (obj.userdata.value == '' || obj.userdata.value == null)
                    ? Center(
                        child: InkWell(
                            onTap: () async{

                          //  obj.userdata.value = await obj.signInWithGoogle();
                          //   if (obj.userdata.value != null)
                          //     print(obj.userdata.value.user!.email);

                            },
                            child: CircleAvatar(
                              backgroundColor: Colors.grey.shade300,
                              radius: 20,
                              backgroundImage: AssetImage('Images/google.png'),
                            )),
                      )
                    : Center(
                        child: Column(
                          children: [
                            Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 1.5, color: Colors.black54)),
                              child: Image.network(
                                  obj.userdata.value.user!.photoURL.toString()),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(obj.userdata.value.user!.displayName.toString()),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(obj.userdata.value.user!.email.toString()),
                            const SizedBox(
                              height: 30,
                            ),
                            ElevatedButton(
                                onPressed: () async {
                                //    bool result = await obj.signOutFromGoogle();
                                // if (result) obj.userdata.value = '';
                                },
                                child: const Text('Logout'))
                          ],
                        ),
                      );
              },
            );
          }),
    );
  }
}
