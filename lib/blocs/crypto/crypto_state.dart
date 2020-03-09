part of 'crypto_bloc.dart';

abstract class CryptoState extends Equatable {
  const CryptoState();

  @override
  List<Object> get props => [];
}

// Initial State
class CryptoEmpty extends CryptoState {}

// Fetching coins
class CryptoLoading extends CryptoState {}

// Retrieved coins
class CryptoLoaded extends CryptoState {
  final List<Coin> coins;

  const CryptoLoaded({this.coins});

  @override
  List<Object> get props => [coins];

  @override
  String toString() => 'CryptoLoaded { coins: $coins }';
}

// API Request Error
class CryptoError extends CryptoState {}
