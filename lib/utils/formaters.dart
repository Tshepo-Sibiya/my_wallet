import 'package:intl/intl.dart';

String formatCurrency(double amount) {
  final currencyFormat = NumberFormat.currency(
    locale: 'en_US',
    symbol: 'R ',
  );
  return currencyFormat.format(amount);
}
