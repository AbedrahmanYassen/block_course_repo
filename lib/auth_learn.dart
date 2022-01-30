import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'authentication.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  var auth = FirebaseAuth.instance.idTokenChanges().listen((event) {
    if (event != null) {
      print('the user has signed in $event');
    } else {
      print('the user hasn\'t signed in $event');
    }
  });

  @override
  void initState() {
    super.initState();
    email = new TextEditingController();
    password = new TextEditingController();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Authentication authentication = new Authentication();
        },
      ),
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('hello click to enter in ')],
        ),
      ),
    );
  }

  Widget _getTextField(
      {required bool isPasswordTextField,
      required TextEditingController controller}) {
    TextEditingController email = new TextEditingController();
    return Container(
      decoration: BoxDecoration(
          color: Colors.green.shade200,
          borderRadius: BorderRadius.circular(35)),
      child: TextField(
        controller: controller,
        obscureText: isPasswordTextField,
        cursorColor: Colors.lightGreen,
        cursorHeight: 30,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: 'Enter the field please ',
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green.shade200),
            borderRadius: BorderRadius.circular(35),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green.shade200),
            borderRadius: BorderRadius.circular(35),
          ),
        ),
      ),
    );
  }
}
