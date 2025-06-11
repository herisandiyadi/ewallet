// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:ewallet/features/transactions/presentation/cubit/transactions_cubit.dart';
import 'package:ewallet/features/transactions/presentation/widgets/card_transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListTransactionPage extends StatefulWidget {
  final String walletId;
  final String currency;
  const ListTransactionPage({
    Key? key,
    required this.walletId,
    required this.currency,
  }) : super(key: key);

  @override
  State<ListTransactionPage> createState() => _ListTransactionPageState();
}

class _ListTransactionPageState extends State<ListTransactionPage> {
  @override
  void initState() {
    Future.microtask(
      () => context.read<TransactionsCubit>().getListTransactions(
        widget.walletId,
        '1',
        '10',
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('History Transaction')),
      body: BlocBuilder<TransactionsCubit, TransactionsState>(
        builder: (context, state) {
          if (state is TransactionsLoading) {
            return Center(
              child: SizedBox(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (state is GetlistTransactionSuccess) {
            log(
              'DATA STATE ${state.transactionListEntity.transactions.length} ${widget.walletId}',
            );
            if (state.transactionListEntity.transactions.isEmpty) {
              return Center(
                child: SizedBox(
                  height: 50,

                  child: Text('Transaction is Empty'),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: state.transactionListEntity.transactions.length,
                itemBuilder: (context, index) {
                  final data = state.transactionListEntity.transactions[index];

                  return CardTransaction(data: data, currency: widget.currency);
                },
              );
            }
          }
          return SizedBox();
        },
      ),
    );
  }
}
