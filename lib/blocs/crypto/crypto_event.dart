part of 'crypto_bloc.dart';

abstract class CryptoEvent extends Equatable {
  const CryptoEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends CryptoEvent {}

class RefreshCoins extends CryptoEvent {}

class LoadMoreCoins extends CryptoEvent {}
