import 'package:flutter/material.dart';
import "alert.dart";
import 'package:provider/provider.dart';
import '../provider/authProvider.dart';
import 'home.dart';

class toggle extends StatefulWidget {
  const toggle({super.key});

  @override
  State<toggle> createState() => _toggleState();
}

class _toggleState extends State<toggle> {
  @override
  Widget build(BuildContext context) {
    return context.watch<PhoneAuth>().userLogedin
        ? const home()
        : const OtpScreen();
  }
}
