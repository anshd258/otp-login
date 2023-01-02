// ignore: file_names
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widget/snackbar.dart';
import 'package:flutter/widgets.dart';

class PhoneAuth with ChangeNotifier {
  String? var_id;
  bool userLogedin = false;

  Future<dynamic> inputOTP(String OTP, BuildContext context) async {
    final FirebaseAuth _auth = await FirebaseAuth.instance;
    if (var_id != null) {
      try {
        PhoneAuthCredential credential =
            PhoneAuthProvider.credential(verificationId: var_id!, smsCode: OTP);
        await _auth.signInWithCredential(credential);
        userLogedin = true;
        notifyListeners();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(snack_Bar(e.toString()));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(snack_Bar("invalid number"));
    }
  }

  Future<dynamic> nativeOTPlogin(
      String phoneNumber, BuildContext context) async {
    final FirebaseAuth _auth = await FirebaseAuth.instance;
    await _auth.verifyPhoneNumber(
      phoneNumber: "+91$phoneNumber",
      verificationCompleted: (PhoneAuthCredential cred) async {
        print("reached here");
        await _auth.signInWithCredential(cred);
        userLogedin = true;
        notifyListeners();
      },
      verificationFailed: (FirebaseAuthException error) async {
        print("varfailed");
        ScaffoldMessenger.of(context).showSnackBar(snack_Bar(error.code));
        notifyListeners();
      },
      codeSent: (String varID, int? rescode) {
        var_id = varID;
      },
      codeAutoRetrievalTimeout: (String varID) {},
    );
  }
}
