import 'package:flutter/material.dart';
import 'package:my_wallet/screens/home_screen.dart';

import '../constants/shared_constants.dart';
import '../shared_widgets/textfield.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.screenPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Center(
              child: Image.asset('assets/images/momentum.png'),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Welcome back!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: AppFontSizes.textSizeLarge,
                color: AppColors.darkPurple,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const TextFieldWithIcon(
              hintText: 'Username',
              icon: Icons.person_2_outlined,
            ),
            const SizedBox(
              height: 20,
            ),
            const TextFieldWithIcon(
              hintText: 'Passworddd',
              icon: Icons.key,
              sufixIcon: FontAwesomeIcons.eyeSlash,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(100.0),
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(10.0), // Set the border radius here
              ),
            ),
            backgroundColor: MaterialStateProperty.all(AppColors.darkPurple),
          ),
          onPressed: () {
            // Navigate to ScreenB when the button is pressed
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Home()),
            );
          },
          child: const Text('Login'),
        ),
      ),
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      home: Login(),
    ),
  );
}
