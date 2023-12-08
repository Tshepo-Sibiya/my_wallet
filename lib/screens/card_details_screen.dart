import 'package:flutter/material.dart';
import 'package:my_wallet/models/message_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/shared_constants.dart';

class CardDetails extends StatefulWidget {
  const CardDetails({super.key});

  @override
  _CardDetailsState createState() => _CardDetailsState();
}

class _CardDetailsState extends State<CardDetails> {
  List<Message> messages = [];
  bool isLoading = true;
  String? _username;

  @override
  void initState() {
    loadJsonData();
    super.initState();
  }

  Future<void> loadJsonData() async {
    _username = await fetchData("username");
    if (_username != '' || _username != null) {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<String?> fetchData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? "Anonymous";
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
              height: 30,
            ),
            const Text(
              'My Card',
              style: TextStyle(
                  fontSize: AppFontSizes.textSizeXLarge,
                  fontWeight: FontWeight.w600,
                  color: AppColors.gray1),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'assets/images/card.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(60),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Name',
                      style: TextStyle(
                          color: AppColors.gray4,
                          fontSize: AppFontSizes.textSizeSmall),
                    ),
                    Text(
                      _username ?? '',
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Bank',
                      style: TextStyle(
                        color: AppColors.gray4,
                        fontSize: AppFontSizes.textSizeSmall,
                      ),
                    ),
                    Text(
                      'Momentum Money',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Account',
                      style: TextStyle(
                          color: AppColors.gray4,
                          fontSize: AppFontSizes.textSizeSmall),
                    ),
                    Text(
                      '*** *** *** 7000',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Status',
                      style: TextStyle(
                          color: AppColors.gray4,
                          fontSize: AppFontSizes.textSizeSmall),
                    ),
                    Text(
                      'Active',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Expiry',
                      style: TextStyle(
                          color: AppColors.gray4,
                          fontSize: AppFontSizes.textSizeSmall),
                    ),
                    Text(
                      '04/2025',
                      style: TextStyle(fontWeight: FontWeight.w600),
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
