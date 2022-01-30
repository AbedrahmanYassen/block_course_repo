import 'package:cloud_firestore_test/Authenticable.dart';
import 'package:cloud_firestore_test/verification_email.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Authentication implements Authenticable {
  Verification verification = new Verification();

  @override
  void singIn(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      verification.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'week-password') {
        Fluttertoast.showToast(msg: 'hey change the password');
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(msg: 'hey change the email man!');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'hi man ');
    }
  }

  @override
  void singOut(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
