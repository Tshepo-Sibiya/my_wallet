import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_wallet/models/message_model.dart';

import '../constants/shared_constants.dart';

class CardDetails extends StatefulWidget {
  @override
  _CardDetailsState createState() => _CardDetailsState();
}

class _CardDetailsState extends State<CardDetails> {
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
                    child: Icon(
                      Icons.arrow_back_ios_new,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'My Card',
              style: TextStyle(
                  fontSize: AppFontSizes.textSizeLarge,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'assets/images/card.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(60),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name',
                      style: TextStyle(
                        color: AppColors.gray3,
                      ),
                    ),
                    Text(
                      'Mr Mom Money',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Bank',
                      style: TextStyle(
                        color: AppColors.gray3,
                      ),
                    ),
                    Text(
                      'Momentum Money',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Account',
                      style: TextStyle(
                        color: AppColors.gray3,
                      ),
                    ),
                    Text(
                      '*** *** *** 7000',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Status',
                      style: TextStyle(
                        color: AppColors.gray3,
                      ),
                    ),
                    Text(
                      'Active',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Expiry',
                      style: TextStyle(
                        color: AppColors.gray3,
                      ),
                    ),
                    Text(
                      '04/2025',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
