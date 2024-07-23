import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:practicefirebase/utills/static_values.dart';
import 'package:practicefirebase/utills/toast.dart';
import 'package:uuid/uuid.dart';
import 'package:video_player/video_player.dart';

class DashboardController extends GetxController {
  static DashboardController get instance => Get.find();

  File? image;
  File? video;

  var filename = const Uuid().v4();
  VideoPlayerController? controller;

  bool loading = false;
  final ImagePicker imagePicker = ImagePicker();

//......... Pick Image from Gallery..........................................................

  Future<void> imgFromGallery() async {
    try {
      final pickedFile =
          await imagePicker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        image = File(pickedFile.path);
        update();
      }
    } catch (e) {
      print('Error picking image: ${e.toString()}');
    }
    update();
  }

  //.........Upload Image to firestore..................................................................................

  Future uploadImage() async {
    try {
      loading = true;
      update();

      //.........store userId in static value...........................................................
      staticValues.userId = staticValues.firebaseAuth.currentUser!.uid;
      var filename = const Uuid().v4();

      //.........store Image to fire storage...........................................................

      final ref =
          staticValues.firebaseStorage.ref().child('Images/$filename.jpg');
      final uploadTask = ref.putFile(image!);

      String url = await (await uploadTask).ref.getDownloadURL();
      //.........also store image and it URL to firestore database...........................................................

      await staticValues.firebaseFirestore
          .collection('Images')
          .doc(filename)
          .set({
        'images': url,
        'id': filename,
        'userId': staticValues.userId,
      });

      showtoast(message: "Upload successfully!", iserror: false);

      loading = false;
      update();
      print("The download URL is " + url.toString());
    } on FirebaseAuth {
      showtoast(message: "No image selected", iserror: true);
      loading = false;
      update();
    } catch (ex) {
      showtoast(message: 'Something went wrong', iserror: true);
      loading = false;
      update();
    }
  }

  //.......................................................................................................................................

//......... Pick video from Gallery...........................................................................................................

  Future<void> vidFromGallery() async {
    try {
      final pickedFile =
          await imagePicker.pickVideo(source: ImageSource.gallery);
      if (pickedFile != null) {
        video = File(pickedFile.path);
        controller = VideoPlayerController.file(video!)
          ..initialize().then(
            (value) {
              controller!.play();
              update();
            },
          );

        update();
      }
    } catch (e) {
      print('Error picking video: ${e.toString()}');
    }
    update();
  }

  //.........Upload video to firestore..................................................................................

  Future uploadVideo() async {
    try {
      loading = true;
      update();

      //.........store userId in static value...........................................................
      staticValues.userId = staticValues.firebaseAuth.currentUser!.uid;
      var filename = const Uuid().v4();

      //.........store video to fire storage...........................................................

      final ref =
          staticValues.firebaseStorage.ref().child('Video/$filename.mp4');
      final uploadTask = ref.putFile(video!);

      String url = await (await uploadTask).ref.getDownloadURL();
      //.........also store image and it URL to firestore database...........................................................

      await staticValues.firebaseFirestore
          .collection('video')
          .doc(filename)
          .set({
        'video': url,
        'id': filename,
        'userId': staticValues.userId,
      });

      showtoast(message: "Upload successfully!", iserror: false);

      loading = false;
      update();
      print("The download URL is " + url.toString());
    } on FirebaseAuth {
      showtoast(message: "No video selected", iserror: true);
      loading = false;
      update();
    } catch (ex) {
      showtoast(message: 'Something went wrong', iserror: true);
      loading = false;
      update();
    }
  }
}
