import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../provider/authProvider.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController ctr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            // Hello again!
            Text(
              'Please Enter Otp',
              style: GoogleFonts.kufam(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'OTP',
              style: GoogleFonts.kufam(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 50),

            //Phone number field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(20.0)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: ctr,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'OTP',
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
                onPressed: () async {
                  await context.read<PhoneAuth>().inputOTP(ctr.text, context);
                },
                style: ElevatedButton.styleFrom(
                    elevation: 10,
                    backgroundColor: Colors.deepOrangeAccent.shade400),
                child: Text(
                  'Submit',
                  style: GoogleFonts.kufam(
                    color: Colors.white,
                  ),
                )),

            const SizedBox(height: 20),
          ]),
        ),
      ),
    );
  }
}
