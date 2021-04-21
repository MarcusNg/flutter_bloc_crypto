part of 'crypto_bloc.dart';

enum CryptoStatus { initial, loading, loaded, error }

class CryptoState extends Equatable {
  final List<Coin> coins;
  final CryptoStatus status;
  final Failure failure;

  const CryptoState({
    required this.coins,
    required this.status,
    required this.failure,
  });

  factory CryptoState.initial() => const CryptoState(
        coins: [],
        status: CryptoStatus.initial,
        failure: Failure(),
      );

  @override
  List<Object> get props => [coins, status, failure];

  CryptoState copyWith({
    List<Coin>? coins,
    CryptoStatus? status,
    Failure? failure,
  }) {
    return CryptoState(
      coins: coins ?? this.coins,
      status: status ?? this.status,
      failure: failure ?? this.failure,
    );
  }
}
