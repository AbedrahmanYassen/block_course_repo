import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Verification {
  void sendEmailVerification() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (!user!.emailVerified && user != null) {
      await user.sendEmailVerification();
      Fluttertoast.showToast(msg: 'vefiy please your account');
    }
  }
}
