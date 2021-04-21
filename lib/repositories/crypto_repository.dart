import 'dart:convert';

import 'package:flutter_bloc_crypto/models/coin_model.dart';
import 'package:flutter_bloc_crypto/models/failure_model.dart';
import 'package:http/http.dart' as http;

class CryptoRepository {
  static const String _baseUrl = 'https://min-api.cryptocompare.com/';
  static const int perPage = 20;

  final http.Client _httpClient;

  CryptoRepository({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  Future<List<Coin>> getTopCoins({required int page}) async {
    final requestUrl =
        '${_baseUrl}data/top/totalvolfull?limit=$perPage&tsym=USD&page=$page';
    try {
      final response = await _httpClient.get(Uri.parse(requestUrl));
      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        final coinList = List.from(data['Data']);
        return coinList.map((e) => Coin.fromMap(e)).toList();
      }
      return [];
    } catch (err) {
      print(err);
      throw Failure(message: err.toString());
    }
  }
}
