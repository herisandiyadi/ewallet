import 'package:ewallet/features/core/shared/format_date.dart';
import 'package:ewallet/features/core/shared/theme.dart';
import 'package:flutter/material.dart';

Future<void> showTransactionDetailDialog(
  BuildContext context, {
  required int id,
  required String type,
  required int amount,
  String? description,
  String? referenceId,
  String? relatedTransactionId,
  required DateTime timestamp,
  required String currency,
}) async {
  final formattedTime = '${timestamp.toUtc()}';

  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Transaction Details',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _detailRow('Transaction ID', id.toString()),
              _detailRow('Type', type),
              _detailRow(
                'Amount',
                currency == 'USD'
                    ? '\$ $amount'
                    : currency == 'GBP'
                    ? '£ $amount'
                    : '€ $amount',
              ),
              _detailRow('Description', description ?? '-'),
              _detailRow('Reference ID', referenceId ?? '-'),
              _detailRow('Related Tx ID', '-'),
              _detailRow('Timestamp (UTC)', formatUtcDate(formattedTime)),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: blueColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text(
                    'Close',
                    style: TextStyle(color: whiteColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget _detailRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Text(
            '$label:',
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        Expanded(flex: 5, child: Text(value)),
      ],
    ),
  );
}
