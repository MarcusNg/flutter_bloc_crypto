import 'dart:convert';

import 'package:http/http.dart' as http;

class CryptoRepository {
  static const String _baseUrl = 'https://min-api.cryptocompare.com/';
  static const int perPage = 20;

  final http.Client _httpClient;

  CryptoRepository({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  getTopCoins() async {
    final requestUrl =
        '${_baseUrl}data/top/totalvolfull?limit=$perPage&tsym=USD';
    final response = await _httpClient.get(Uri.parse(requestUrl));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      final coinList = data['Data'];
    }
  }
}
