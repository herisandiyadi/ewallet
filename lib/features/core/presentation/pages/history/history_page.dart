import 'package:ewallet/features/core/shared/theme.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: orangeCOlor,
        title: const Text('History Transaksi'),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: const Center(child: Text('Data Kosong')),
    );
  }
}
