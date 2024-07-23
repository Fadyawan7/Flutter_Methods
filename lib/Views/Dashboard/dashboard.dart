import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:practicefirebase/Auth/Signup/signup.dart';
import 'package:practicefirebase/Views/Dashboard/dashboard_controller.dart';
import 'package:practicefirebase/utills/static_values.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';

class Dashboard extends StatefulWidget {
  Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Dashboard', style: GoogleFonts.aDLaMDisplay()),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            onSelected: (value) async {
              if (value == 'logout') {
                staticValues.firebaseAuth.signOut();
                staticValues.userId = null;
                SharedPreferences pref = await SharedPreferences.getInstance();

                pref.clear();
                Get.to(() => Signup());
              }
            },
            itemBuilder: (context) {
              return <PopupMenuEntry>[
                PopupMenuItem(
                    value: 'logout',
                    child: Row(
                      children: [Text('Logut')],
                    ))
              ];
            },
          )
        ],
      ),
      body: GetBuilder<DashboardController>(
          init: DashboardController(),
          builder: (obj) {
            return Center(
                child: Column(
              children: [
                Text('Upload Image and Video ',
                    style: GoogleFonts.aDLaMDisplay()),
                // SizedBox(
                //   height: height * 0.05,
                // ),
                // InkWell(
                //   onTap: () {
                //     obj.imgFromGallery();
                //   },
                //   child: obj.image == null
                //       ? Image(
                //           image: AssetImage('Images/google.png'),
                //           height: height * 0.2,
                //         )
                //       : Image.file(
                //           obj.image!,
                //           fit: BoxFit.cover,
                //           height: height * 0.2,
                //         ),
                // ),
                // SizedBox(
                //   height: height * 0.04,
                // ),
                // Text('Pick Image ', style: GoogleFonts.aDLaMDisplay()),
                // SizedBox(
                //   height: height * 0.03,
                // ),
                // ElevatedButton(
                //   onPressed: () {
                //     obj.uploadImage();
                //   },
                //   child: obj.loading
                //       ? CircularProgressIndicator()
                //       : Text('Upload Image ',
                //           style: GoogleFonts.aDLaMDisplay()),
                // ),

//............pick video UI ..............................................................................................................

                SizedBox(
                  height: height * 0.05,
                ),
                InkWell(
                    onTap: () {
                      obj.vidFromGallery();
                    },
                    child: obj.video == null
                        ? Container(
                            color: Colors.grey.shade300,
                            height: height * 0.4,
                            width: width * 01,
                            child: Icon(Icons.video_file),
                          )
                        : Container(
                            height: height * 0.4,
                            width: width * 0.8,
                            child: obj.controller!.value.isInitialized
                                ? AspectRatio(
                                    aspectRatio:
                                        obj.controller!.value.aspectRatio,
                                    child: VideoPlayer(obj.controller!),
                                  )
                                : Center(child: CircularProgressIndicator()),
                          )),
                SizedBox(
                  height: height * 0.04,
                ),
                Text('Pick Video ', style: GoogleFonts.aDLaMDisplay()),
                SizedBox(
                  height: height * 0.03,
                ),
                ElevatedButton(
                  onPressed: () {
                    obj.uploadVideo();
                  },
                  child: obj.loading
                      ? CircularProgressIndicator()
                      : Text('Upload Video ',
                          style: GoogleFonts.aDLaMDisplay()),
                )
              ],
            ));
          }),
    );
  }
}
