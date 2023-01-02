import 'package:flutter/material.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        primary: true,
        elevation: 5,
        centerTitle: true,
        leading: const BackButton(
          color: Colors.black,
        ),
        shadowColor: Colors.black87,
      ),
      body: Center(child: Text("HELLOW")),
    );
  }
}
