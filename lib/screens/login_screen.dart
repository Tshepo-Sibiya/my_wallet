import 'package:flutter/material.dart';

import '../constants/shared_constants.dart';
import '../shared_widgets/textfield.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login extends StatefulWidget {
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
              hintText: 'Password',
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
          onPressed: () {},
          child: const Text('Login'),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Login(),
  ));
}
