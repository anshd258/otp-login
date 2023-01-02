import 'package:flutter/material.dart';
import '../widget/snackbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../provider/authProvider.dart';
import 'alert.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            // Hello again!
            Text(
              'Hello Bruh!',
              style: GoogleFonts.kufam(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'You have been missed!',
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
                    controller: phoneController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Phone number',
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
                onPressed: () {
                  if (phoneController.text.length == 10) {
                    //checking if phone number enterd is valid
                    context
                        .read<PhoneAuth>()
                        .nativeOTPlogin(phoneController.text, context);
                    Navigator.pushNamedAndRemoveUntil(context, "/toggle",
                        (route) => false); //calling the alertbox

                  } else {
                    // showing a snackbarr if number is innvalid and reseting the controller
                    ScaffoldMessenger.of(context)
                        .showSnackBar(snack_Bar("invalid text"));
                  }
                },
                style: ElevatedButton.styleFrom(
                    elevation: 10,
                    backgroundColor: Colors.deepOrangeAccent.shade400),
                child: Text(
                  'Get OTP',
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
