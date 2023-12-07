import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_wallet/models/transaction_model.dart';
import 'package:my_wallet/screens/inbox_screen.dart';

import '../constants/shared_constants.dart';
import '../utils/formaters.dart';
import 'login_screen.dart';
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Transaction> transactions = [];

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    // Replace 'assets/data.json' with the path to your JSON file
    String jsonString = await DefaultAssetBundle.of(context)
        .loadString('assets/mock_data/transactions.json');

    // Decode the JSON string into a list of objects
    Map<String, dynamic> data = jsonDecode(jsonString);
    List<dynamic> jsonList = data['transaction'];
    print(jsonList);
    // Convert each JSON object to a MyObject and add it to the list
    List<Transaction> tempList =
        jsonList.map((item) => Transaction.fromJson(item)).toList();

    setState(() {
      transactions = tempList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.screenPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Wallet',
                      style: TextStyle(
                        color: AppColors.darkPurple,
                        fontSize: AppFontSizes.textSizeMedium,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Active',
                    ),
                  ],
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/profile.png',
                        fit: BoxFit.cover,
                        width: 70.0,
                        height: 70.0,
                      ),
                    )),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            // Center(
            //   child: Image.asset('assets/images/InfoSection.png'),
            // ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'assets/images/InfoSection.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Column(
                //   children: [
                //     IconButton(
                //       color: AppColors.purple,
                //       onPressed: () {
                //         Navigator.push(
                //           context,
                //           MaterialPageRoute(builder: (context) => Login()),
                //         );
                //       },
                //       icon: const Icon(Icons.person_outlined),
                //     ),
                //     Text('Profile')
                //   ],
                // ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                  child: Column(
                    children: [
                      const Icon(
                        Icons.person_outline,
                        color: AppColors.purple,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text('Profile')
                    ],
                  ),
                ),
                const SizedBox(
                  width: 40,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Inbox()),
                    );
                  },
                  child: Column(
                    children: [
                      const Icon(
                        Icons.notifications_outlined,
                        color: AppColors.purple,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text('Inbox')
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Recent Transactions',
              style: TextStyle(
                fontWeight: FontWeight.bold,
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
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        transactions[index].name ?? '',
                        style: const TextStyle(color: AppColors.darkPurple),
                      ),
                      subtitle: Text(transactions[index].description ?? ''),
                      leading: ClipOval(
                        child: Image.network(
                          transactions[index].transactionImageUrl ?? '',
                          // You can customize the width, height, fit, etc.
                          width: 50.0,
                          height: 50.0,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.image);
                          },
                        ),
                      ),
                      trailing: Text(
                        formatCurrency(transactions[index].amount ?? 0),
                        style: const TextStyle(
                            color: Color.fromRGBO(106, 13, 173, 1)),
                      ),
                      // You can customize the ListTile as needed
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
