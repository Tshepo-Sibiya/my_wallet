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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  IconData icondata = FontAwesomeIcons.eyeSlash;
  bool isShowing = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSizes.screenPadding),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
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
                    fontWeight: FontWeight.w600,
                    fontSize: AppFontSizes.textSizeXLarge,
                    color: AppColors.darkPurple,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  controller: _usernameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Username is required';
                    }
                    return null; // Return null for no validation error
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    fillColor: const Color(0xFFF2F2F2),
                    hintText: 'Username',
                    filled: true,
                    prefixIcon: const Icon(
                      Icons.person_3_outlined,
                      color: AppColors.purple,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText: isShowing,
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    }
                    return null; // Return null for no validation error
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    fillColor: const Color(0xFFF2F2F2),
                    hintText: 'Password',
                    filled: true,
                    prefixIcon: const Icon(
                      Icons.key,
                      color: AppColors.purple,
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isShowing = !isShowing;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(
                          isShowing
                              ? FontAwesomeIcons.eyeSlash
                              : FontAwesomeIcons.eye,
                          color: AppColors.gray3,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 63,
                  width: 193,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.darkPurple),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        String username = _usernameController.text;
                        String password = _passwordController.text;
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Home()),
                        );
                      }
                    },
                    child: const Text('Login'),
                  ),
                ),
              ],
            ),
          ),
        )

        // Padding(
        //   padding: const EdgeInsets.all(AppSizes.screenPadding),
        //   child:
        // ),
        // bottomNavigationBar: Padding(
        //   padding: const EdgeInsets.all(100.0),
        //   child: SizedBox(
        //     height: 63,
        //     width: 193,
        //     child: ElevatedButton(
        //       style: ButtonStyle(
        //         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        //           RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(15.0),
        //           ),
        //         ),
        //         backgroundColor: MaterialStateProperty.all(AppColors.darkPurple),
        //       ),
        //       onPressed: () {
        //         Navigator.push(
        //           context,
        //           MaterialPageRoute(builder: (context) => const Home()),
        //         );
        //       },
        //       child: const Text('Login'),
        //     ),
        //   ),
        // ),
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
