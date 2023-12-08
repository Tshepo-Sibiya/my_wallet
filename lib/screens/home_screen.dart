import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_wallet/models/message_model.dart';
import 'package:my_wallet/models/transaction_model.dart';
import 'package:my_wallet/screens/inbox_screen.dart';
import 'package:my_wallet/screens/profile_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/shared_constants.dart';
import '../utils/formaters.dart';
import 'dart:convert';
import 'package:flutter_svg/flutter_svg.dart';

import 'card_details_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Transaction> transactions = [];
  Random random = Random();
  double randomDouble = 0;

  @override
  void initState() {
    super.initState();
    loadJsonData();
    randomDouble = random.nextDouble() * (1000000.00 - 5.00) + 5.00;
  }

  Future<void> loadJsonData() async {
    String jsonString = await DefaultAssetBundle.of(context)
        .loadString('assets/mock_data/transactions.json');
    Map<String, dynamic> data = jsonDecode(jsonString);
    List<dynamic> jsonList = data['transaction'];
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
                  children: const [
                    Text(
                      'Wallet',
                      style: TextStyle(
                        color: AppColors.darkPurple,
                        fontSize: AppFontSizes.textSizeXLarge,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Active',
                      style: TextStyle(
                        color: AppColors.gray3,
                        fontSize: AppFontSizes.textSizeSmall,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Profile()),
                    );
                  },
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/profile.png',
                      fit: BoxFit.cover,
                      width: 70.0,
                      height: 70.0,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CardDetails()),
                );
              },
              child: Stack(
                children: [
                  SvgPicture.asset(
                    'assets/svg/balance.svg',
                    width: 200.0,
                    height: 200.0,
                    color: AppColors.darkPurple,
                  ),
                  Positioned(
                    top: 50.0,
                    left: 30.0,
                    bottom: 20.0,
                    right: 20.0,
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Balance',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: AppFontSizes.textSizeSmall,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                formatCurrency(randomDouble),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: AppFontSizes.textSizeXLarge,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              const Text(
                                'Linked to card',
                                style: TextStyle(
                                  color: AppColors.gray4,
                                  fontSize: AppFontSizes.textSizeSmall,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                color: AppColors.purple,
                                Icons.arrow_forward_ios,
                                size: 40,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // GestureDetector(
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => CardDetails()),
            //     );
            //   },
            //   child: Center(
            //     child: SizedBox(
            //       width: MediaQuery.of(context).size.width,
            //       child: Image.asset(
            //         'assets/images/balance_card.png',
            //         fit: BoxFit.cover,
            //       ),
            //     ),
            //   ),
            // ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Profile()),
                    );
                  },
                  child: Column(
                    children: const [
                      Icon(
                        Icons.person_outline,
                        color: AppColors.purple,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Profile',
                        style: TextStyle(fontSize: 13, color: AppColors.gray2),
                      )
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
                    children: const [
                      Icon(
                        Icons.notifications_outlined,
                        color: AppColors.purple,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Inbox',
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.gray2,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Recent Transactions',
              style: TextStyle(
                fontWeight: FontWeight.w500,
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
                        style: const TextStyle(
                          color: AppColors.darkPurple,
                          fontSize: AppFontSizes.textSizeSmall,
                        ),
                      ),
                      subtitle: Text(transactions[index].description ?? '',
                          style: const TextStyle(
                            color: AppColors.gray3,
                            fontSize: AppFontSizes.textSizeXSmall,
                          )),
                      leading: ClipOval(
                        child: Image.network(
                          transactions[index].transactionImageUrl ?? '',
                          width: 44.0,
                          height: 44.0,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.image);
                          },
                        ),
                      ),
                      trailing: Text(
                        formatCurrency(transactions[index].amount ?? 0),
                        style: const TextStyle(
                          color: AppColors.darkPurple,
                          fontSize: AppFontSizes.textSizeSmall,
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
