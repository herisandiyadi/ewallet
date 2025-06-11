import 'package:flutter/material.dart';

Future<void> showWalletFormDialog({
  required BuildContext context,
  required void Function(String currency, int balance) onSubmit,
}) {
  final formKey = GlobalKey<FormState>();
  String selectedCurrency = 'USD';
  final balanceController = TextEditingController();

  return showDialog(
    context: context,
    builder:
        (context) => AlertDialog(
          title: const Text('Add Wallet'),
          content: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButtonFormField<String>(
                  value: selectedCurrency,
                  decoration: const InputDecoration(labelText: 'Currency'),
                  items:
                      ['USD', 'GBP', 'EUR'].map((currency) {
                        return DropdownMenuItem(
                          value: currency,
                          child: Text(currency),
                        );
                      }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      selectedCurrency = value;
                    }
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: balanceController,
                  decoration: const InputDecoration(
                    labelText: 'Initial Balance',
                    hintText: 'Enter initial balance',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Balance is required';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Balance must be a number';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  onSubmit(selectedCurrency, int.parse(balanceController.text));
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
  );
}
