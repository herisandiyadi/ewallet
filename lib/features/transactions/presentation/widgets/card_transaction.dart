import 'package:ewallet/features/core/shared/theme.dart';
import 'package:ewallet/features/transactions/domain/entities/transaction_entity.dart';
import 'package:ewallet/features/transactions/presentation/widgets/dialog_transaction.dart';
import 'package:flutter/material.dart';

import '../../../core/shared/format_date.dart';

class CardTransaction extends StatelessWidget {
  final TransactionEntity data;
  final String currency;
  const CardTransaction({
    super.key,
    required this.data,
    required this.currency,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: GestureDetector(
        onTap: () {
          showTransactionDetailDialog(
            context,
            id: data.id,
            type: data.type,
            amount: data.amount,
            timestamp: data.timestamp,
            description: data.description,
            referenceId: data.referenceId,
            relatedTransactionId: data.relatedTransactionId.toString(),
            currency: currency,
          );
        },
        child: SizedBox(
          height: 120,
          child: Card(
            borderOnForeground: true,
            color: softGreyColor,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        data.type,
                        style: blackTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: semiBold,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          currency == 'USD'
                              ? '\$'
                              : currency == 'GBP'
                              ? '£'
                              : '€',
                          style: blackTextStyle.copyWith(
                            fontSize: 24,
                            fontWeight: semiBold,
                          ),
                        ),
                        Text(
                          data.amount.toString(),
                          style: blackTextStyle.copyWith(
                            fontSize: 24,
                            fontWeight: semiBold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        formatUtcDate(data.timestamp.toString()),
                        textAlign: TextAlign.right,
                        style: blackTextStyle.copyWith(
                          fontSize: 10,
                          fontWeight: medium,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
