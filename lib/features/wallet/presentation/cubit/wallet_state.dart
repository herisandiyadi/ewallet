part of 'wallet_cubit.dart';

abstract class WalletState extends Equatable {
  const WalletState();

  @override
  List<Object> get props => [];
}

class WalletInitial extends WalletState {}

class WalletLoading extends WalletState {}

class CreateNewWalletSuccess extends WalletState {
  final WalletEntity walletEntity;

  const CreateNewWalletSuccess({required this.walletEntity});

  @override
  List<Object> get props => [walletEntity];
}

class GetDetailWalletSuccess extends WalletState {
  final WalletEntity walletEntity;

  const GetDetailWalletSuccess({required this.walletEntity});

  @override
  List<Object> get props => [walletEntity];
}

class GetListWalletSuccess extends WalletState {
  final List<WalletEntity> walletEntity;

  const GetListWalletSuccess({required this.walletEntity});

  @override
  List<Object> get props => [walletEntity];
}

class WalletFailed extends WalletState {
  final String message;

  const WalletFailed({required this.message});

  @override
  List<Object> get props => [message];
}

// class WalletInitial extends WalletState {}
