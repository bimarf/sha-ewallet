import 'package:bank_sha/models/transaction_model.dart';
import 'package:bank_sha/shared/shared_methods.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../shared/theme.dart';

class HomeLatestTransactionItem extends StatelessWidget {
  final TransactionModel transaction;

  const HomeLatestTransactionItem({Key? key, required this.transaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      child: Row(
        children: [
          Image.asset(
            transaction.transactionType!.code == 'top_up'
                ? 'assets/ic_transaction_cat1.png'
                : 'assets/ic_transaction_cat5.png',
            width: 48,
          ), // dr = shop cart
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.transactionType!.name.toString(),
                  style:
                      blackTextStyle.copyWith(fontWeight: medium, fontSize: 16),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  DateFormat('MM dd')
                      .format(transaction.createdAt ?? DateTime.now()),
                  style: greyTextStyle.copyWith(fontSize: 12),
                ),
              ],
            ),
          ),
          Text(
            formatCurrency(transaction.amount ?? 0,
                symbol:
                    transaction.transactionType!.action == 'cr' ? '+ ' : '-'),
            style: blackTextStyle.copyWith(fontWeight: medium, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
