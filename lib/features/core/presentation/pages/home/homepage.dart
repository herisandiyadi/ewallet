import 'package:ewallet/features/core/shared/theme.dart';
import 'package:ewallet/features/transactions/presentation/pages/list_transaction_page.dart';
import 'package:ewallet/features/transactions/presentation/widgets/dialog_menu.dart';
import 'package:ewallet/features/wallet/presentation/cubit/wallet_cubit.dart';
import 'package:ewallet/features/wallet/presentation/widgets/wallet_dialog.dart';
import 'package:ewallet/features/transactions/presentation/pages/amount/amount_page.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void getListWallet() {
    context.read<WalletCubit>().getListWallet();
  }

  @override
  void initState() {
    super.initState();
    getListWallet();
    // cekSaldo();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: const EdgeInsets.only(left: 24, right: 24, top: 80, bottom: 32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome,',
                  style: greyTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: regular,
                  ),
                ),
                const SizedBox(height: 2),
              ],
            ),
          ],
        ),
      );
    }

    Widget card() {
      return Container(
        margin: const EdgeInsets.only(left: 24, right: 24, bottom: 20),
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: orangeCOlor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Add New Wallet',
                      style: whiteTextStyle.copyWith(fontSize: 16),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  showWalletFormDialog(
                    context: context,
                    onSubmit: (currency, balance) {
                      context.read<WalletCubit>().createNewWallet(
                        currency,
                        balance,
                      );
                    },
                  );
                },
                child: const Card(
                  color: whiteColor,
                  child: SizedBox(
                    height: 30,
                    width: 30,
                    child: Icon(Icons.add, size: 24, color: blackColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget listWallet() {
      return BlocConsumer<WalletCubit, WalletState>(
        listener: (context, state) {
          if (state is CreateNewWalletSuccess) {
            getListWallet();
          }
        },
        builder: (context, state) {
          if (state is WalletLoading) {
            return Center(
              child: SizedBox(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (state is GetListWalletSuccess) {
            if (state.walletEntity.isNotEmpty) {
              return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: state.walletEntity.length,
                itemBuilder: (context, index) {
                  final data = state.walletEntity[index];
                  return SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Card(
                        color: greenColor,
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder:
                                  //         (context) =>
                                  //             const AmountPage(title: 'Transfer'),
                                  //   ),
                                  // );
                                  showActionDialog(
                                    context: context,
                                    onSelected: (action) {
                                      print('User selected: $action');

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (context) => AmountPage(
                                                title: '$action',
                                                currency: data.currency,
                                                walletId: data.id.toString(),
                                              ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: SizedBox(
                                  height: 100,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        data.currency == 'USD'
                                            ? 'US Dollar'
                                            : data.currency == 'GBP'
                                            ? 'Poundsterling'
                                            : 'Euro',
                                        style: whiteTextStyle.copyWith(
                                          fontSize: 16,
                                          fontWeight: semiBold,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            data.currency == 'USD'
                                                ? '\$'
                                                : data.currency == 'GBP'
                                                ? '£'
                                                : '€',
                                            style: whiteTextStyle.copyWith(
                                              fontSize: 24,
                                              fontWeight: semiBold,
                                            ),
                                          ),
                                          Text(
                                            data.balance.toString(),
                                            style: whiteTextStyle.copyWith(
                                              fontSize: 24,
                                              fontWeight: semiBold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => ListTransactionPage(
                                          walletId: data.id.toString(),
                                          currency: data.currency,
                                        ),
                                  ),
                                );
                              },
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(color: orangeCOlor),
                                child: Center(
                                  child: Text(
                                    'View',
                                    textAlign: TextAlign.center,
                                    style: whiteTextStyle.copyWith(
                                      fontSize: 24,
                                      fontWeight: semiBold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          }
          return SizedBox(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => const AmountPage(
                          title: 'Transfer',
                          currency: '',
                          walletId: '',
                        ),
                  ),
                );
              },
              child: FlipCard(
                flipOnTouch: false,
                autoFlipDuration: Duration(seconds: 1),
                onFlip: () {},
                front: Card(
                  color: greenColor,
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.sync_alt, size: 48, color: whiteColor),
                        Text(
                          'Transfer',
                          style: whiteTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: semiBold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                back: Card(
                  color: greenColor,
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.sync_alt, size: 48, color: whiteColor),
                        Text(
                          'BACK',
                          style: whiteTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: semiBold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          Column(children: [header(), card(), Expanded(child: listWallet())]),
          Positioned(
            top: -100,
            left: -30,
            right: -30,
            child: Image.asset('assets/images/logos.png', height: 280),
          ),
        ],
      ),
    );
  }
}
