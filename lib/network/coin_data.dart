import 'dart:async';
import 'dart:convert';
import 'package:coinager/utilities/constants.dart';
import 'package:http/http.dart' as http;

const List<String> currencyList = [
  'NGN',
  'USDT',
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR',
];
const List<String> cryptoList = [
  'BTC',
  'ETH',
  'BNB',
  'LTC',
  'POLC',
  'SCRT',
  'AVAX',
];

const kBaseURL = 'https://rest.coinapi.io/v1/exchangerate';

class CoinData {
  Future getCoinData(String selectedCurrency) async {
    String url = '$kBaseURL/BTC/$selectedCurrency?apikey=$kAPIkey';
    http.Response res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var data = res.body;
      var coinValue = jsonDecode(data)['rate'];
      return coinValue;
    } else {
      print(res.statusCode);
      print('Error in connection');
    }
  }
}
