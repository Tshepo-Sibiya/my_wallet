import 'package:flutter/material.dart';
import 'package:my_wallet/models/message_model.dart';

import '../constants/shared_constants.dart';
import 'login_screen.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<Message> messages = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.screenPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.gray6,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Profile',
              style: TextStyle(
                fontSize: AppFontSizes.textSizeMedium,
                color: AppColors.darkPurple,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ClipOval(
              child: Image.asset(
                'assets/images/profile.png',
                fit: BoxFit.cover,
                width: 70.0,
                height: 70.0,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Mr Mom Money',
              style: TextStyle(
                fontSize: AppFontSizes.textSizeMedium,
                color: AppColors.darkPurple,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 150,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                  );
                },
                child: Column(
                  children: [
                    ClipOval(
                      child: Container(
                        padding:
                            const EdgeInsets.all(AppFontSizes.textSizeXXSmall),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.white,
                            width: 2.0,
                          ),
                        ),
                        child: const ClipOval(
                          child: Icon(
                            Icons.key_outlined,
                            color: AppColors.purple,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Log Out',
                      style: TextStyle(
                        fontSize: AppFontSizes.textSizeMedium,
                        color: AppColors.purple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(50),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            padding: const EdgeInsets.all(AppFontSizes.textSizeXXSmall),
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.close,
              color: Colors.white,
              size: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}
