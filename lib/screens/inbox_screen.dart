import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_wallet/models/message_model.dart';

import '../constants/shared_constants.dart';

class Inbox extends StatefulWidget {
  const Inbox({super.key});

  @override
  _InboxState createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  List<Message> messages = [];

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    String jsonString = await DefaultAssetBundle.of(context)
        .loadString('assets/mock_data/messages.json');

    Map<String, dynamic> data = jsonDecode(jsonString);
    List<dynamic> jsonList = data['message'];
    List<Message> tempList =
        jsonList.map((item) => Message.fromJson(item)).toList();

    setState(() {
      messages = tempList;
    });
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
              'Inbox',
              style: TextStyle(
                fontSize: AppFontSizes.textSizeMedium,
                color: AppColors.darkPurple,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: LayoutBuilder(builder: (context, constraints) {
                return ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.all(AppSizes.paddingMedium),
                      child: Padding(
                        padding: const EdgeInsets.all(AppSizes.paddingMedium),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              messages[index].dateTime ?? '',
                              style: const TextStyle(
                                  fontSize: AppFontSizes.textSizeXSmall,
                                  color: AppColors.gray3),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              messages[index].message ?? '',
                              style: const TextStyle(
                                fontSize: AppFontSizes.textSizeSmall,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
