

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class staticValues {

 static String? userId; 
  static   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  static   FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  static  FirebaseStorage firebaseStorage = FirebaseStorage.instance;



}