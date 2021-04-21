import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_crypto/models/coin_model.dart';
import 'package:flutter_bloc_crypto/models/failure_model.dart';
import 'package:flutter_bloc_crypto/repositories/crypto_repository.dart';

part 'crypto_event.dart';
part 'crypto_state.dart';

class CryptoBloc extends Bloc<CryptoEvent, CryptoState> {
  final CryptoRepository _cryptoRepository;

  CryptoBloc({required CryptoRepository cryptoRepository})
      : _cryptoRepository = cryptoRepository,
        super(CryptoState.initial());

  @override
  Stream<CryptoState> mapEventToState(
    CryptoEvent event,
  ) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    } else if (event is RefreshCoins) {
      yield* _getCoins();
    } else if (event is LoadMoreCoins) {
      yield* _mapLoadMoreCoinsToState();
    }
  }

  Stream<CryptoState> _getCoins({int page = 0}) async* {
    try {
      final coins = [
        if (page != 0) ...state.coins,
        ...await _cryptoRepository.getTopCoins(page: page),
      ];
      yield state.copyWith(coins: coins, status: CryptoStatus.loaded);
    } on Failure catch (err) {
      yield state.copyWith(
        failure: err,
        status: CryptoStatus.error,
      );
    }
  }

  Stream<CryptoState> _mapAppStartedToState() async* {
    yield state.copyWith(status: CryptoStatus.loading);
    yield* _getCoins();
  }

  Stream<CryptoState> _mapLoadMoreCoinsToState() async* {
    final nextPage = state.coins.length ~/ CryptoRepository.perPage;
    yield* _getCoins(page: nextPage);
  }
}
